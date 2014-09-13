function parse(txt) {
  var doc = Xml.parse(txt, true);
  var attr = doc.spellcheck;
  if (attr) {
    return "Cannot find actor: " + attr.name;
  }
 
  var actors = doc.html.head.getElements("actor");      
  var movies = doc.html.head.getElements("movie");
  
  if (!actors || actors.length ==0) {
    return "no match found";
  }
  
  var movieIndex = 0;
  var r = '';
  var firstPerson = true;
  for (var i in actors) {
    r = r + actors[i].getText();
    if (movies[movieIndex]) {
      r = r + (firstPerson ? "" : " who") + " was in " +
        movies[movieIndex].getText() + " with ";
    }
    movieIndex++;
    firstPerson = false;
  }
  
  return r;
}