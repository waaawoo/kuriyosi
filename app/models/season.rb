class Season < ActiveHash::Base
  self.data = [
    { id: 1, name: "---"},
    { id: 2, name: "春"},
    { id: 3, name: "夏"},
    { id: 4, name: "秋"},
    { id: 5, name: "冬"}
  ]

end
