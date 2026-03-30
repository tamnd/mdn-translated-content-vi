---
title: Property (JavaScript)
slug: Glossary/Property/JavaScript
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thuộc tính JavaScript** là một thành viên của [đối tượng](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects) liên kết một khóa với một giá trị. Đối tượng JavaScript là một cấu trúc dữ liệu lưu trữ tập hợp các thuộc tính.

Một thuộc tính bao gồm các phần sau:

- Một _tên_ (còn gọi là _khóa_), có thể là một [chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) hoặc một [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol).
- Một _giá trị_, có thể là bất kỳ giá trị JavaScript nào. Thuộc tính có giá trị là hàm cũng có thể được gọi là {{Glossary("method")}}.
- Một số _thuộc tính mô tả_, xác định cách thuộc tính có thể được đọc và ghi. Thuộc tính có thể có các mô tả `configurable`, `enumerable` và `writable`.

[Thuộc tính accessor](/en-US/docs/Web/JavaScript/Guide/Data_structures#accessor_property) không có "giá trị" thực sự. Giá trị được biểu diễn gián tiếp thông qua một cặp hàm: một hàm (getter) được gọi khi đọc giá trị và một hàm (setter) được gọi khi gán giá trị. Tuy nhiên, thuộc tính accessor hoạt động giống như thuộc tính dữ liệu thông thường bề ngoài, vì các hàm getter và setter được gọi tự động và thường trong suốt đối với mã JavaScript.

Giá trị của thuộc tính (bao gồm getter và setter) và các mô tả của nó được lưu trong một bản ghi dữ liệu gọi là _property descriptor_. Nhiều phương thức, chẳng hạn như {{jsxref("Object.getOwnPropertyDescriptor()")}} và {{jsxref("Object.defineProperty()")}}, làm việc với property descriptor.

Bản thân thuật ngữ _thuộc tính_ không tương ứng với bất kỳ giá trị JavaScript nào — đây là một khái niệm trừu tượng. Ví dụ, trong đoạn mã sau:

```js
const obj = {
  a: 1,
  b() {},
};
```

Đối tượng `obj` có hai thuộc tính. Thuộc tính đầu tiên có khóa là `"a"` và giá trị là `1`. Thuộc tính thứ hai có khóa là `"b"` và giá trị là một hàm (sử dụng [cú pháp phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions)). Các liên kết `"a"` – `1`, `"b"` – `function` chính là các thuộc tính của đối tượng.

Trong ngữ cảnh của [lớp](/en-US/docs/Web/JavaScript/Reference/Classes), thuộc tính có thể chia thành _thuộc tính thực thể_, thuộc sở hữu của từng thực thể, và _thuộc tính tĩnh_, thuộc sở hữu của lớp và chứa dữ liệu chung cho tất cả các thực thể. Trong ngữ cảnh của [kế thừa](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain), thuộc tính cũng có thể chia thành _thuộc tính riêng_, thuộc sở hữu của chính đối tượng, và _thuộc tính kế thừa_, thuộc sở hữu của các đối tượng trong chuỗi prototype của đối tượng đó.

Để biết thêm thông tin về việc đọc và ghi thuộc tính, hãy xem [làm việc với đối tượng](/en-US/docs/Web/JavaScript/Guide/Working_with_objects).

## Xem thêm

- [Property (programming)](<https://en.wikipedia.org/wiki/Property_(programming)>) trên Wikipedia
- [Giới thiệu về lập trình hướng đối tượng JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects)
- [Thuộc tính đối tượng](/en-US/docs/Web/JavaScript/Guide/Data_structures#properties)
- [Khả năng liệt kê và quyền sở hữu thuộc tính](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
