---
title: Sao chép sâu
slug: Glossary/Deep_copy
page-type: glossary-definition
sidebar: glossarysidebar
---

**Sao chép sâu** (deep copy) của một đối tượng là bản sao mà các thuộc tính của nó không chia sẻ cùng tham chiếu (trỏ đến cùng giá trị cơ bản) với những thuộc tính của đối tượng nguồn mà bản sao được tạo từ đó. Kết quả là, khi bạn thay đổi đối tượng nguồn hoặc bản sao, bạn có thể yên tâm rằng mình không gây ra thay đổi cho đối tượng kia. Điều này trái ngược với {{Glossary("shallow copy","sao chép nông")}}, trong đó các thay đổi đối với các thuộc tính lồng nhau trong nguồn hoặc bản sao có thể gây ra thay đổi cho đối tượng kia.

Trong JavaScript, các thao tác sao chép đối tượng tích hợp tiêu chuẩn ([cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax), [`Array.prototype.concat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat), [`Array.prototype.slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice), [`Array.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from), và [`Object.assign()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)) không tạo ra sao chép sâu (thay vào đó, chúng tạo ra sao chép nông).

Một cách để tạo sao chép sâu của một đối tượng JavaScript, nếu nó có thể được {{Glossary("serialization","tuần tự hóa")}}, là sử dụng {{jsxref("JSON.stringify()")}} để chuyển đổi đối tượng thành chuỗi JSON, sau đó {{jsxref("JSON.parse()")}} để chuyển đổi chuỗi trở lại thành đối tượng JavaScript (hoàn toàn mới):

```js
const ingredientsList = ["noodles", { list: ["eggs", "flour", "water"] }];
const ingredientsListDeepCopy = JSON.parse(JSON.stringify(ingredientsList));
```

Web API {{DOMxRef("Window.structuredClone", "structuredClone()")}} cũng tạo ra sao chép sâu và có ưu điểm là cho phép [các đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) trong nguồn được _chuyển_ sang bản sao mới, thay vì chỉ được sao chép.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Shallow copy")}}
- {{DOMxRef("Window.structuredClone()")}}
- {{DOMxRef("WorkerGlobalScope.structuredClone()")}}
