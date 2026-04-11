---
title: "Navigator: thuộc tính globalPrivacyControl"
short-title: globalPrivacyControl
slug: Web/API/Navigator/globalPrivacyControl
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.globalPrivacyControl
---

{{APIRef("DOM")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`Navigator.globalPrivacyControl`** trả về cài đặt [Global Privacy Control](https://globalprivacycontrol.org/) của người dùng cho trang web hiện tại.
Cài đặt này cho biết liệu người dùng có đồng ý cho phép trang web hoặc dịch vụ bán hoặc chia sẻ thông tin cá nhân của họ với bên thứ ba hay không.

Giá trị của thuộc tính phản ánh giá trị của tiêu đề HTTP {{httpheader("Sec-GPC")}}.

## Giá trị

`true` nếu người dùng _không_ đồng ý bán hoặc chia sẻ dữ liệu của họ một cách rõ ràng.
`false` nếu người dùng đồng ý hoặc chưa chỉ ra tùy chọn.

## Ví dụ

```js
console.log(navigator.globalPrivacyControl);
// "true" if the user has specifically indicated they do not want their data shared or sold, otherwise "false".
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("Sec-GPC")}}
- [globalprivacycontrol.org](https://globalprivacycontrol.org/)
- [Do Not Track on Wikipedia](https://en.wikipedia.org/wiki/Do_Not_Track)
