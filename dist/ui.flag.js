
/**
 * ng-flags module
 * Turns country ISO code to flag thumbnail.
 *
 * Author: asafdav - https://github.com/asafdav
 */

(function() {
  angular.module('uiFlag', []).directive('flag', function() {
    return {
      scope: {
        country: '@',
        size: '@?'
      },
      replace: true,
      template: "<span class='{{size || 16}}'> <span class='flag {{country | lowercase}}'> </span> </span>"
    };
  });

}).call(this);
