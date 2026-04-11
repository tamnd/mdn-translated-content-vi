---
title: "Navigator: thuộc tính doNotTrack"
short-title: doNotTrack
slug: Web/API/Navigator/doNotTrack
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.Navigator.doNotTrack
---

{{ApiRef("HTML DOM")}}{{Deprecated_header}}{{non-standard_header}}

Thuộc tính **`Navigator.doNotTrack`** trả về cài đặt Không theo dõi của người dùng, cho biết liệu người dùng có yêu cầu các trang web và nhà quảng cáo không theo dõi họ hay không.

Giá trị của thuộc tính phản ánh giá trị của tiêu đề HTTP {{httpheader("DNT")}}, tức là các giá trị của `"1"`, `"0"` hoặc `null`.

Toàn bộ thông số kỹ thuật DNT (Không theo dõi) đã bị ngừng sử dụng. Thiết kế cơ chế có sai sót vì đây là tính năng hợp tác giữa người dùng, trang web và trình duyệt. Ý tưởng là người dùng yêu cầu _website_ không theo dõi họ và _website_ sẽ tuân theo. Tuy nhiên, không có sự thực thi nghiêm ngặt chính sách này, vì vậy các trang web quảng cáo đã bỏ qua tiêu đề DNT và vẫn theo dõi người dùng. Do đó, tính năng này là vô dụng. Hơn nữa, điều này có hại vì nó để lại nhiều người dùng [fingerprint](/en-US/docs/Glossary/Fingerprinting) hơn trong tiêu đề, điều này có thể được sử dụng để theo dõi người dùng nhiều hơn.

Các trình duyệt đang khám phá các tính năng bảo mật có tính thực thi cao hơn khác, chẳng hạn như [global privacy control](/en-US/docs/Web/API/Navigator/globalPrivacyControl), hạn chế đối với cookie của bên thứ ba, v.v.

## Giá trị

Một chuỗi hoặc `null`.

## Ví dụ

```js
console.log(navigator.doNotTrack);
// prints "1" if DNT is enabled; "0" if the user opted-in for tracking; otherwise null
```

## Thông số kỹ thuật

Một phần của thông số kỹ thuật [Tracking Preference Expression (DNT)](https://w3c.github.io/dnt/drafts/tracking-dnt.html#dom-navigator-donottrack) đã ngừng hoạt động.

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề HTTP {{httpheader("DNT")}}
