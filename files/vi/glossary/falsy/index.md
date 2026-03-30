---
title: Falsy
slug: Glossary/Falsy
page-type: glossary-definition
sidebar: glossarysidebar
---

Giá trị **falsy** (đôi khi viết là **falsey**) là giá trị được coi là false khi gặp trong ngữ cảnh {{Glossary("Boolean","Boolean")}}.

{{Glossary("JavaScript")}} sử dụng {{Glossary("Type_Conversion","chuyển đổi kiểu")}} để ép buộc bất kỳ giá trị nào thành Boolean trong các ngữ cảnh yêu cầu, như {{Glossary("Conditional","điều kiện")}} và {{Glossary("Loop","vòng lặp")}}.

Bảng sau cung cấp danh sách đầy đủ các giá trị falsy trong JavaScript:

| Giá trị                     | Kiểu      | Mô tả                                                                                                                              |
| --------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| {{Glossary("null")}}        | Null      | Từ khóa [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) — sự vắng mặt của bất kỳ giá trị nào.                        |
| {{Glossary("undefined")}}   | Undefined | [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) — giá trị nguyên thủy.                                |
| `false`                     | Boolean   | Từ khóa [`false`](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words).                                            |
| {{Glossary("NaN")}}         | Number    | [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) — không phải số.                                                  |
| `0`                         | Number    | {{jsxref("Number")}} không, bao gồm cả `0.0`, `0x0`, v.v.                                                                          |
| `-0`                        | Number    | {{jsxref("Number")}} âm không, bao gồm cả `-0.0`, `-0x0`, v.v.                                                                     |
| `0n`                        | BigInt    | {{jsxref("BigInt")}} không, bao gồm cả `0x0n`, v.v. Lưu ý rằng không có {{jsxref("BigInt")}} âm không — phủ định của `0n` là `0n`. |
| `""`                        | String    | Giá trị [chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) rỗng, bao gồm cả `''` và ` `` `.                       |
| {{domxref("document.all")}} | Object    | Đối tượng falsy duy nhất trong JavaScript là {{domxref("document.all")}} tích hợp sẵn.                                             |

Các giá trị `null` và `undefined` cũng là {{Glossary("nullish","nullish")}}.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Truthy")}}
  - {{Glossary("Type_coercion", "Ép kiểu")}}
  - {{Glossary("Boolean")}}
- [Ép buộc Boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion)
