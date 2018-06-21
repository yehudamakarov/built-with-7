$(function () {
    $('.js-show').click(function(e) {
        e.preventDefault();
        const JSONPath = `${e.target.pathname}.json`;
        $.getJSON(JSONPath, function(respData) {
            const toInsert = new TemplateEntry(respData);
            const newHTML = toInsert.templateString();
            $(`#js-accomplishment-info-${toInsert.accomplishmentId}`)
                .html(newHTML)
                .addClass("open-up");
        })
    })

    /**
     * A class that formats response JSON to JSON fit for a Handlebars Template.
     * @param {JSON} respData JSON from server.
     * @return {object} that comprises relevant data and that can return its own
     * template.
     */
    class TemplateEntry {
        constructor(respData) {
            this.accomplishmentId = parseInt(respData.data.id);
            this.since = respData.data.attributes.since;
        }

        /**
         * A function that returns a handlebars template ready to be inserted to the DOM.
         * @returns {string}
         * @memberof TemplateEntry
         */
        templateString() {
            return HandlebarsTemplates['accomplishment_show'](
                {
                    accomplishment: this,
                }
            )
        }
    }
})
