---
title: "WorkerNavigator: thuộc tính globalPrivacyControl"
short-title: globalPrivacyControl
slug: Web/API/WorkerNavigator/globalPrivacyControl
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WorkerNavigator.globalPrivacyControl
---

{{APIRef("DOM")}}{{SeeCompatTable}}{{AvailableInWorkers("worker")}}

Thuộc tính chỉ đọc **`WorkerNavigator.globalPrivacyControl`** trả về thiết lập [Global Privacy Control](https://globalprivacycontrol.org/) của người dùng cho trang web hiện tại. Thiết lập này cho biết người dùng có đồng ý để trang web hoặc dịch vụ bán hoặc chia sẻ thông tin cá nhân của họ với bên thứ ba hay không.

Giá trị của thuộc tính này phản ánh giá trị của tiêu đề HTTP {{httpheader("Sec-GPC")}}.

## Giá trị

`true` nếu người dùng rõ ràng _không_ cho phép bán hoặc chia sẻ dữ liệu của họ.
`false` nếu người dùng cho phép, hoặc chưa nêu rõ tùy chọn.

## Ví dụ

```js
console.log(navigator.globalPrivacyControl);
// "true" nếu người dùng đã chỉ rõ rằng họ không muốn dữ liệu của mình được chia sẻ hoặc bán, ngược lại là "false".
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("Sec-GPC")}}
- [globalprivacycontrol.org](https://globalprivacycontrol.org/)
- [Do Not Track trên Wikipedia](https://en.wikipedia.org/wiki/Do_Not_Track)
