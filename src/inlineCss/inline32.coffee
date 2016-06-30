angular.module 'uiFlag'


.run ()->
    !angular.$$csp().noInlineStyle  and  \
        !angular.$$uiFlagInlineCss  and  \
        angular.element(document).find('head')
            .prepend("""<style type="text/css">@@CSS_32</style>""")
    angular.$$uiFlagInlineCss = true
