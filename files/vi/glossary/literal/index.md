---
title: Literal
slug: Glossary/Literal
page-type: glossary-definition
sidebar: glossarysidebar
---

**Literal** (giá trị trực tiếp) đại diện cho các giá trị trong JavaScript. Đây là các giá trị cố định — không phải biến — mà bạn _trực tiếp_ cung cấp trong script của mình.

- [Literal mảng](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals)
- [Literal boolean](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#boolean_literals)
- [Literal số dấu phẩy động](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#floating-point_literals)
- [Literal số](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#numeric_literals)
- [Literal đối tượng](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#object_literals)
- [Literal RegExp](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#regexp_literals)
- [Literal chuỗi](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#string_literals)

## Ví dụ

### Literal chuỗi

Một literal chuỗi là không hoặc nhiều ký tự được đặt trong dấu ngoặc kép (`"`) hoặc dấu nháy đơn (`'`). Một chuỗi phải được phân cách bằng dấu ngoặc cùng loại (tức là hoặc cả hai là dấu nháy đơn, hoặc cả hai là dấu nháy kép).

Sau đây là các ví dụ về literal chuỗi:

```js
"foo";
"bar";
"1234";
"one line \n new line";
"Joyo's cat";
```

### Literal đối tượng

Một literal đối tượng là danh sách không hoặc nhiều cặp tên thuộc tính và giá trị liên kết của một đối tượng, được đặt trong dấu ngoặc nhọn (`{}`).

Sau đây là ví dụ về một literal đối tượng. Phần tử đầu tiên của đối tượng `car` định nghĩa thuộc tính `myCar` và gán cho nó một chuỗi mới `"Toyota"`; phần tử thứ hai, thuộc tính `getCar`, ngay lập tức được gán kết quả của việc gọi hàm `carTypes('Honda')`; phần tử thứ ba, thuộc tính `special`, sử dụng một biến hiện có (`sales`).

```js
const sales = "BMW";

function carTypes(name) {
  return name === "Honda" ? name : `Sorry, we don't sell ${name}.`;
}

const car = {
  myCar: "Toyota",
  getCar: carTypes("Honda"),
  special: sales,
};

console.log(car.myCar); // Toyota
console.log(car.getCar); // Honda
console.log(car.special); // BMW
```

## Xem thêm

- [Literal](<https://en.wikipedia.org/wiki/Literal_(computer_programming)>) trên Wikipedia
