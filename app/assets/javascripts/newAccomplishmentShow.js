$(function() {
    $('form').submit(function(e) {
        e.preventDefault();
        const values = $(this).serialize();
        const postResp = $.post('/accomplishments', values);
        postResp.done(function(respData) {
            // so this is always going to run and the IF/ELSE in the controller
            // is deciding what to send back to this request.

            // We unbind the eventListener from `this` which is the element that
            // the function was bound to.
            const toInsert = new TemplateEntry(respData);
            const newHTML = toInsert.templateString();
            $('#js-accomplishment-info')
                .html(newHTML)
                .addClass("open-up")
        }).error(function(respData) {
            $('h1').html(respData.responseJSON.title["0"])
        })
    });

    class TemplateEntry {
        constructor(respData) {
            this.title = respData.data.attributes.title,
            this.effect = respData.data.attributes.effect,
            this.since = respData.data.attributes.since,
            this.humanTime = respData.data.attributes["human-time"]
            this.days = [
                ...respData.data.attributes.days.map(function(day) {
                    return {
                        name: day.name,
                    }
                })
            ]
        }
        templateString() {
            return HandlebarsTemplates['new_accomplishment_show'](
                {
                    accomplishment: this,
                }
            )
        }
    }
})