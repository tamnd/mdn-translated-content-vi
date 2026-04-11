---
title: "Navigator: thuộc tính cookieEnabled"
short-title: cookieEnabled
slug: Web/API/Navigator/cookieEnabled
page-type: web-api-instance-property
browser-compat: api.Navigator.cookieEnabled
---

{{ApiRef("HTML DOM")}}

`navigator.cookieEnabled` trả về giá trị Boolean cho biết cookie có được bật hay không.

Thuộc tính chỉ đọc.

## Giá trị

Một boolean.

> [!LƯU Ý]
> Trình duyệt web có thể ngăn việc ghi một số cookie nhất định trong một số trường hợp nhất định. Ví dụ: các trình duyệt dựa trên Chrome, cũng như một số phiên bản thử nghiệm của Firefox, không cho phép tạo cookie với thuộc tính [`SameSite=None`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value), trừ khi chúng được tạo qua HTTPS và với thuộc tính `Secure`.

## Ví dụ

```js
if (!navigator.cookieEnabled) {
  // The browser does not support or is blocking cookies from being set.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
