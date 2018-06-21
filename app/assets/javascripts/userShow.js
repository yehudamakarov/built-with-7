$(function() {
    $('.js-show').click(function getUserInfo(e) {
        e.preventDefault();
        const JSONPath = `${e.target.pathname}.json`;
        $.getJSON(JSONPath, function(respData) {
            window.respData = respData;
            console.log('respData :', respData);
            // HandleBarsTemplates['accomplishments_list']({accomplishments:
            // respData.data})
        });
    });
});

/**
 * A class that formats response JSON to JSON fit for a Handlebars Template.
 * @param {JSON} respData JSON from server, heavily nested..
 * @return {object} that comprises relevant data and that can return its own
 * template.
 */
class TemplateEntry {
    constructor(respData) {
        this.days = [
            ...respData.included.map(function(obj) {
                return {
                    userId: parseInt(respData.data.id),
                    dayId: parseInt(obj.id),
                    accomplishments: [
                        ...obj.attributes.accomplishments.data.map(function(accomplishment) {
                            return {
                                id: parseInt(accomplishment.id),
                                humanTime: ''
                            }
                        })
                    ],
                };
            })
        ]
    }

    templateString() {
        return HandlebarsTemplates['accomplishments_list'](
            {
                days: this.days,
            }
        )
    }
}