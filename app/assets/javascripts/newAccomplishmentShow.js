$(() => {
    $('form').submit((e) => {
        e.preventDefault();
        const values = $(e.target).serialize();
        const postResp = $.post('/accomplishments', values);
        postResp.done((respData) => {
            const toInsert = new TemplateEntry(respData);
            const newHTML = toInsert.templateString();
            $('#js-accomplishment-info')
                .html(newHTML)
                .addClass('open-up');
        }).error((respData) => {
            let errorMessage = 'There was an error: Title ';
            errorMessage += respData.responseJSON.title['0'];
            $('#js-accomplishment-info').html(errorMessage)
                .addClass('open-up-error');
        });
    });

    /**
     *
     *
     * @class TemplateEntry
     */
    class TemplateEntry {
        /**
         *Creates an instance of TemplateEntry.
         * @param {*} respData
         * @memberof TemplateEntry
         */
        constructor(respData) {
            this.title = respData.data.attributes.title,
            this.effect = respData.data.attributes.effect,
            this.since = respData.data.attributes.since,
            this.humanTime = respData.data.attributes['human-time'],
            this.days = [
                ...respData.data.attributes.days.map((day) => {
                    return {
                        name: day.name,
                    };
                }),
            ];
        }
        /**
         *
         *
         * @return {str}
         * @memberof TemplateEntry
         */
        templateString() {
            return HandlebarsTemplates['new_accomplishment_show'](
                {
                    accomplishment: this,
                }
            );
        }
    }
});
