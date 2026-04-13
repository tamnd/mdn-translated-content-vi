---
title: "console: phương thức tĩnh table()"
short-title: table()
slug: Web/API/console/table_static
page-type: web-api-static-method
browser-compat: api.console.table_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.table()`** hiển thị dữ liệu dạng bảng dưới dạng một bảng.

## Cú pháp

```js-nolint
console.table(data)
console.table(data, columns)
```

### Tham số

- `data`
  - : Dữ liệu cần hiển thị. Đây phải là một mảng hoặc một đối tượng. Mỗi mục trong mảng hoặc mỗi thuộc tính trong đối tượng được biểu diễn bằng một hàng trong bảng. Cột đầu tiên của bảng được gắn nhãn `(index)` và các giá trị của nó là chỉ số mảng hoặc tên thuộc tính.

    Nếu các phần tử trong mảng, hoặc các thuộc tính trong đối tượng, bản thân chúng cũng là mảng hoặc đối tượng, thì các mục hoặc thuộc tính của chúng sẽ được liệt kê trong hàng, mỗi mục trong một cột.

    Lưu ý rằng trong Firefox, `console.table()` bị giới hạn ở 1000 hàng hiển thị, bao gồm cả hàng tiêu đề.

- `columns` {{optional_inline}}
  - : Một mảng có thể được dùng để giới hạn các cột hiển thị trong bảng. Nó chứa các chỉ số nếu mỗi phần tử của `data` là một mảng, hoặc các tên thuộc tính nếu mỗi phần tử của `data` là một đối tượng. Bảng kết quả khi đó sẽ chỉ bao gồm các cột cho những mục khớp với các chỉ số hoặc tên đã cho.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Tập hợp các kiểu nguyên thủy

Đối số `data` có thể là một mảng hoặc một đối tượng.

```js
// một mảng các chuỗi

console.table(["apples", "oranges", "bananas"]);
```

| (index) | Values    |
| ------- | --------- |
| 0       | 'apples'  |
| 1       | 'oranges' |
| 2       | 'bananas' |

```js
// một đối tượng mà các thuộc tính là chuỗi

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

const me = new Person("Tyrone", "Jones");

console.table(me);
```

| (index)   | Values   |
| --------- | -------- |
| firstName | 'Tyrone' |
| lastName  | 'Jones'  |

### Tập hợp các kiểu phức hợp

Nếu các phần tử trong mảng, hoặc các thuộc tính trong đối tượng, bản thân chúng cũng là mảng hoặc đối tượng, thì các phần tử hoặc thuộc tính của chúng sẽ được liệt kê trong hàng, mỗi mục trong một cột:

```js
// một mảng các mảng

const people = [
  ["Tyrone", "Jones"],
  ["Janet", "Smith"],
  ["Maria", "Cruz"],
];
console.table(people);
```

| (index) | 0        | 1       |
| ------- | -------- | ------- |
| 0       | 'Tyrone' | 'Jones' |
| 1       | 'Janet'  | 'Smith' |
| 2       | 'Maria'  | 'Cruz'  |

```js
// một mảng các đối tượng

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

const tyrone = new Person("Tyrone", "Jones");
const janet = new Person("Janet", "Smith");
const maria = new Person("Maria", "Cruz");

console.table([tyrone, janet, maria]);
```

Nếu mảng chứa các đối tượng, các cột sẽ được gắn nhãn bằng tên thuộc tính.

| (index) | firstName | lastName |
| ------- | --------- | -------- |
| 0       | 'Tyrone'  | 'Jones'  |
| 1       | 'Janet'   | 'Smith'  |
| 2       | 'Maria'   | 'Cruz'   |

```js
// một đối tượng mà các thuộc tính là các đối tượng

const family = {};

family.mother = new Person("Janet", "Jones");
family.father = new Person("Tyrone", "Jones");
family.daughter = new Person("Maria", "Jones");

console.table(family);
```

| (index)  | firstName | lastName |
| -------- | --------- | -------- |
| daughter | 'Maria'   | 'Jones'  |
| father   | 'Tyrone'  | 'Jones'  |
| mother   | 'Janet'   | 'Jones'  |

### Giới hạn các cột được hiển thị

Mặc định, `console.table()` liệt kê tất cả các phần tử trong mỗi hàng. Bạn có thể dùng tham số tùy chọn `columns` để chọn một tập con các cột cần hiển thị:

```js
// một mảng các đối tượng, chỉ ghi log firstName

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

const tyrone = new Person("Tyrone", "Jones");
const janet = new Person("Janet", "Smith");
const maria = new Person("Maria", "Cruz");

console.table([tyrone, janet, maria], ["firstName"]);
```

| (index) | firstName |
| ------- | --------- |
| 0       | 'Tyrone'  |
| 1       | 'Janet'   |
| 2       | 'Maria'   |

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.table()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#table)
- [Tài liệu của Node.js về `console.table()`](https://nodejs.org/docs/latest/api/console.html#consoletabletabulardata-properties)
- [Tài liệu của Google Chrome về `console.table()`](https://developer.chrome.com/docs/devtools/console/api/#table)
