function addAll(products) {
  window.localStorage.setItem("basket", JSON.stringify(products));
}
function readAll() {
  return JSON.parse(window.localStorage.getItem("basket"));
}
function clear(){
  window.localStorage.removeItem("basket");
}

module.exports = {
  add: addAll,
  read: readAll,
  clear: clear,
};