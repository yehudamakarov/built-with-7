$(() => {
    $('.js-show').click((e) => {
        e.preventDefault();
        const JSONPath = `${e.target.pathname}.json`;
        $.getJSON(JSONPath, (respData) => {
            const toInsert = new TemplateEntry(respData);
            const newHTML = toInsert.templateString();
            $(`#js-user-info-${toInsert.userId}`)
                .html(newHTML)
                .addClass('open-up');
        });
    });

    /**
     * A class that formats response JSON to JSON fit for a Handlebars Template.
     * @param {JSON} respData JSON from server, heavily nested..
     * @return {object} that comprises relevant data and that can return its own
     * template.
     */
    class TemplateEntry {
        /**
         *Creates an instance of TemplateEntry.
         * @param {*} respData
         * @memberof TemplateEntry
         */
        constructor(respData) {
            this.userId = parseInt(respData.data.id);
            this.days = [
                ...respData.included.map((obj) => {
                    return {
                        userId: parseInt(respData.data.id),
                        dayId: parseInt(obj.id),
                        dayName: obj.attributes.name,
                        accomplishments: [
                            ...obj.attributes.accomplishments.map(
                                (accomplishment) => {
                                    return {
                                        id: parseInt(accomplishment.id),
                                        title: accomplishment.title,
                                        humanTime: accomplishment['human-time'],
                                    };
                                }
                            ),
                        ],
                    };
                }),
            ];
        }

        /**
         * A function that returns a handlebars template ready to be inserted to
         * the DOM.
         * @return {string}
         * @memberof TemplateEntry
         */
        templateString() {
            return HandlebarsTemplates['days_list'](
                {
                    days: this.days,
                }
            );
        }
    }
});
