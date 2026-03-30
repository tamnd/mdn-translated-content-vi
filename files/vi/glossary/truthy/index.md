---
title: Truthy
slug: Glossary/Truthy
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{Glossary("JavaScript")}}, một giá trị **truthy** là giá trị được coi là `true` khi gặp trong ngữ cảnh {{Glossary("Boolean")}}. Tất cả các giá trị đều là truthy trừ khi chúng được định nghĩa là {{Glossary("Falsy", "falsy")}}. Nghĩa là, tất cả các giá trị đều _truthy_ ngoại trừ `false`, `0`, `-0`, `0n`, `""`, `null`, `undefined`, `NaN` và {{domxref("document.all")}}.

{{Glossary("JavaScript")}} sử dụng {{Glossary("Type_Coercion", "ép kiểu")}} trong ngữ cảnh Boolean.

Ví dụ về các giá trị _truthy_ trong JavaScript (sẽ được ép thành `true` trong ngữ cảnh boolean, và do đó thực thi khối `if`):

```js
if (true);
if ({});
if ([]);
if (42);
if ("0");
if ("false");
if (new Date());
if (-42);
if (12n);
if (3.14);
if (-3.14);
if (Infinity);
if (-Infinity);
```

Nếu toán hạng đầu tiên là truthy, [toán tử AND logic](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND) trả về toán hạng thứ hai:

```js
true && "dog";
// trả về "dog"

[] && "dog";
// trả về "dog"
```

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Falsy")}}
  - {{Glossary("Type_Coercion", "Type coercion")}}
  - {{Glossary("Boolean")}}
- [Ép kiểu Boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion)
