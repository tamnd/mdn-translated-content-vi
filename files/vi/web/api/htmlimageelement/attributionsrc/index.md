---
title: "HTMLImageElement: attributionSrc property"
short-title: attributionSrc
slug: Web/API/HTMLImageElement/attributionSrc
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLImageElement.attributionSrc
---

{{APIRef("Attribution Reporting API")}}{{securecontext_header}}{{deprecated_header}}

Thuộc tính **`attributionSrc`** của giao diện {{domxref("HTMLImageElement")}} mà bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu hình ảnh. Nó phản ánh thuộc tính nội dung [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/img#attributionsrc) của phần tử `<img>`.

Xem [API báo cáo phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

## Giá trị

Một chuỗi trống hoặc danh sách URL được phân tách bằng dấu cách. Để giải thích thuộc tính này, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#attributionsrc).

## Ví dụ

### Đặt một attributionSrc trống

```html
<img src="advertising-image.png" />
```

```js
const imgElem = document.querySelector("img");
imgElem.attributionSrc = "";
```

### Đặt attributionSrc chứa URL

```html
<img src="advertising-image.png" />
```

```js
// encode the URLs in case they contain special characters
// such as '=' that would be improperly parsed.
const encodedUrlA = encodeURIComponent("https://a.example/register-source");
const encodedUrlB = encodeURIComponent("https://b.example/register-source");

const imgElem = document.querySelector("img");
imgElem.attributionSrc = `${encodedUrlA} ${encodedUrlB}`;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API báo cáo phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API).
