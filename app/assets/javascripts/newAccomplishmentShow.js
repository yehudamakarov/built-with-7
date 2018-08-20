$(() => {
    const handleSubmit = (e) => {
        e.preventDefault();
        const values = $(e.target).serialize();
        console.log('values :', values);
        // values : utf8=%E2%9C%93&authenticity_token=5%2BKTWM82czmfuP6jMxRCCmyJ6omx7cZ76cnljIwa1m2dsPf%2B3voj%2BjTaxnU2PMqkt0CYNifSnFUZIY4tPVQnzQ%3D%3D&accomplishment%5Btitle%5D=123123123&accomplishment%5Beffect%5D=12312312312312312&accomplishment%5Bday%5D=Monday&accomplishment%5Bdate_time(1i)%5D=2018&accomplishment%5Bdate_time(2i)%5D=7&accomplishment%5Bdate_time(3i)%5D=1&accomplishment%5Bdate_time(4i)%5D=15&accomplishment%5Bdate_time(5i)%5D=00&accomplishment%5Bday_ids%5D%5B%5D=&accomplishment%5Bday_ids%5D%5B%5D=2&accomplishment%5Bday_ids%5D%5B%5D=4&accomplishment%5Bday_ids%5D%5B%5D=7
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
    };
    $('form').submit(handleSubmit);


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
            this.id = respData.data.id
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
