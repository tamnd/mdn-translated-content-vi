---
title: HTML spellcheck global attribute
short-title: spellcheck
slug: Web/HTML/Reference/Global_attributes/spellcheck
page-type: html-attribute
browser-compat: html.global_attributes.spellcheck
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`spellcheck`** là thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) xác định xem phần tử có thể được kiểm tra lỗi chính tả hay không.

> [!NOTE]
> Thuộc tính này chỉ là gợi ý cho trình duyệt: các trình duyệt không bắt buộc phải kiểm tra lỗi chính tả. Thông thường các phần tử không thể chỉnh sửa sẽ không được kiểm tra lỗi chính tả, ngay cả khi thuộc tính `spellcheck` được đặt thành `true` và trình duyệt hỗ trợ kiểm tra chính tả.

{{InteractiveExample("HTML Demo: spellcheck", "tabbed-shorter")}}

<!-- cSpell:ignore exampull checkd spellung -->

```html interactive-example
<textarea spellcheck="true">
This exampull will be checkd fur spellung when you try to edit it.</textarea
>

<textarea spellcheck="false">
This exampull will nut be checkd fur spellung when you try to edit it.</textarea
>
```

Thuộc tính có thể có các giá trị sau:

- Chuỗi rỗng hoặc `true`, cho biết phần tử nên được kiểm tra lỗi chính tả nếu có thể;
- `false`, cho biết phần tử không nên được kiểm tra lỗi chính tả.

Nếu thuộc tính này không được đặt, giá trị mặc định của nó được xác định theo loại phần tử và trình duyệt. Giá trị mặc định này cũng có thể được _kế thừa_, nghĩa là nội dung phần tử chỉ được kiểm tra lỗi chính tả nếu phần tử tổ tiên gần nhất có trạng thái _spellcheck_ là `true`.

## Các vấn đề về bảo mật và quyền riêng tư

Việc sử dụng kiểm tra chính tả có thể gây ra hậu quả đối với bảo mật và quyền riêng tư của người dùng.
Đặc tả không quy định _cách_ kiểm tra chính tả được thực hiện và nội dung của phần tử có thể được gửi đến bên thứ ba để nhận kết quả kiểm tra chính tả (xem [enhanced spellchecking and "spell-jacking"](https://www.comparitech.com/blog/information-security/what-is-spell-jacking/)).

Bạn nên cân nhắc đặt `spellcheck` thành `false` cho các phần tử có thể chứa thông tin nhạy cảm.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect).
