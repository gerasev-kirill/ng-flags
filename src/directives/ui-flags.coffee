###*
# ng-flags module
# Turns country ISO code to flag thumbnail.
#
# Author: asafdav - https://github.com/asafdav
###

angular.module('uiFlag', [])

.directive 'flag',
    () ->
        scope:{
            country: '@',
            size: '@?'
        }
        replace: true
        template: "
        <span class='f{{size || 16}}'>
            <span class='flag {{country | lowercase}}'>
            </span>
        </span>
        "
