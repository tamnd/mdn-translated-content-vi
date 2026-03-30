---
title: Sao chép nông
slug: Glossary/Shallow_copy
page-type: glossary-definition
sidebar: glossarysidebar
---

**Shallow copy** (bản sao nông) của một đối tượng là một bản sao mà các thuộc tính của nó chia sẻ cùng {{Glossary("object reference","tham chiếu")}} (trỏ đến cùng giá trị bên dưới) như những thuộc tính của đối tượng nguồn mà bản sao được tạo ra. Kết quả là, khi bạn thay đổi nguồn hoặc bản sao, bạn cũng có thể làm cho đối tượng kia thay đổi. Hành vi này trái ngược với hành vi của {{Glossary("deep copy","bản sao sâu")}}, trong đó nguồn và bản sao hoàn toàn độc lập.

Chính thức hơn, hai đối tượng `o1` và `o2` là shallow copy nếu:

1. Chúng không phải là cùng một đối tượng (`o1 !== o2`).
2. Các thuộc tính của `o1` và `o2` có cùng tên theo cùng thứ tự.
3. Giá trị các thuộc tính của chúng bằng nhau.
4. Chuỗi prototype của chúng bằng nhau.

Xem thêm định nghĩa về _{{Glossary("deep copy", "tương đương cấu trúc")}}_.

Bản sao của một đối tượng mà tất cả các thuộc tính đều có giá trị nguyên thủy phù hợp với định nghĩa của cả {{Glossary("deep copy","bản sao sâu")}} và shallow copy. Tuy nhiên, việc nói về độ sâu của bản sao như vậy là hơi vô nghĩa, vì nó không có thuộc tính lồng nhau và chúng ta thường nói về deep copy trong bối cảnh thay đổi các thuộc tính lồng nhau.

Đối với shallow copy, chỉ các thuộc tính cấp cao nhất được sao chép, không phải giá trị của các đối tượng lồng nhau. Do đó:

- Việc gán lại các thuộc tính cấp cao nhất của bản sao không ảnh hưởng đến đối tượng nguồn.
- Việc gán lại các thuộc tính đối tượng lồng nhau của bản sao ảnh hưởng đến đối tượng nguồn.

Trong JavaScript, tất cả các thao tác sao chép đối tượng tích hợp tiêu chuẩn ([spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), [`Array.prototype.concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat), [`Array.prototype.slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice), [`Array.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from) và [`Object.assign()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)) tạo ra shallow copy thay vì deep copy.

Hãy xem xét ví dụ sau, trong đó một mảng `ingredientsList` được tạo ra, sau đó một đối tượng `ingredientsListCopy` được tạo ra bằng cách sao chép mảng `ingredientsList` đó.

```js
const ingredientsList = ["noodles", { list: ["eggs", "flour", "water"] }];

const ingredientsListCopy = Array.from(ingredientsList);
console.log(ingredientsListCopy);
// ["noodles",{"list":["eggs","flour","water"]}]
```

Việc gán lại giá trị của một thuộc tính lồng nhau sẽ hiển thị trong cả hai đối tượng.

```js
ingredientsListCopy[1].list = ["rice flour", "water"];
console.log(ingredientsList[1].list);
// Array [ "rice flour", "water" ]
```

Việc gán lại giá trị của một thuộc tính cấp cao nhất (chỉ số `0` trong trường hợp này) sẽ chỉ hiển thị trong đối tượng đã thay đổi.

```js
ingredientsListCopy[0] = "rice noodles";
console.log(ingredientsList[0]); // noodles
console.log(JSON.stringify(ingredientsListCopy));
// ["rice noodles",{"list":["rice flour","water"]}]
console.log(JSON.stringify(ingredientsList));
// ["noodles",{"list":["rice flour","water"]}]
```

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Deep copy")}}
