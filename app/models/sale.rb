class Sale < ActiveHash::Base
  self.data = [
    { id: 1, name: "---", sale: 100},
    { id: 2, name: "5%", sale: 0.95},
    { id: 3, name: "10%", sale: 0.9},
    { id: 4, name: "15%", sale: 0.85},
    { id: 5, name: "20%", sale: 0.8}
  ]
end
