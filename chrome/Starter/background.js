// Samuel Svenningsen (altock@gmail.com)
// Began: 1/25/16
// Last edited: 1/26/15


function isNormalInteger(str) {
        var n = Number(str);
        return String(n) === str && n >= 0;
}

chrome.runtime.onInstalled.addListener(function() {
  chrome.declarativeContent.onPageChanged.removeRules(undefined, function() {


    // Shows the pageAction when on xkcd.com
    chrome.declarativeContent.onPageChanged.addRules([
      {
        conditions: [
          new chrome.declarativeContent.PageStateMatcher({
            pageUrl: { urlContains: 'xkcd' },
          })
        ],

        actions: [ new chrome.declarativeContent.ShowPageAction() ]
      }
    ]);

    //Sends you to appropriate explainxkcd when pageAction clicked
    chrome.pageAction.onClicked.addListener(function(tab){
      chrome.tabs.getSelected(null, function(tab) {

        tabUrl = tab.url;
        urlArr = tabUrl.split("com"); // splits on com to get comic #
        end = urlArr[1].replace(/\//g,""); // removes the backslashes after com.
        //This will be either empty or a number if on xkcd.
        if (isNormalInteger(end) || end == "") {
          chrome.tabs.update({url:"http://www.explainxkcd.com/wiki/index.php/"+end});
        }

      });
    });
  });
});
