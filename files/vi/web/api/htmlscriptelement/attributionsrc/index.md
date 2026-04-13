---
title: "HTMLScriptElement: thuộc tính attributionSrc"
short-title: attributionSrc
slug: Web/API/HTMLScriptElement/attributionSrc
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLScriptElement.attributionSrc
---

{{APIRef("Attribution Reporting API")}}{{securecontext_header}}{{deprecated_header}}

Thuộc tính **`attributionSrc`** của giao diện {{domxref("HTMLScriptElement")}} lấy và đặt thuộc tính [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/script#attributionsrc) trên phần tử {{htmlelement("script")}} theo chương trình, phản ánh giá trị của thuộc tính đó. `attributionsrc` chỉ định rằng bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu tài nguyên tập lệnh.

Ở phía máy chủ, tiêu đề này được dùng để kích hoạt việc gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi, để đăng ký [nguồn phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#javascript-based_event_sources) hoặc [kích hoạt phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#javascript-based_attribution_triggers) dựa trên JavaScript. Tiêu đề phản hồi nào cần gửi lại phụ thuộc vào giá trị của tiêu đề `Attribution-Reporting-Eligible` đã kích hoạt việc đăng ký.

> [!NOTE]
> Ngoài ra, nguồn phân bổ hoặc kích hoạt phân bổ dựa trên JavaScript cũng có thể được đăng ký bằng cách gửi yêu cầu {{domxref("Window/fetch", "fetch()")}} có chứa tùy chọn `attributionReporting` (đặt trực tiếp trên lệnh gọi `fetch()` hoặc trên đối tượng {{domxref("Request")}} được truyền vào lệnh gọi `fetch()`), hoặc bằng cách gửi {{domxref("XMLHttpRequest")}} với {{domxref("XMLHttpRequest.setAttributionReporting", "setAttributionReporting()")}} được gọi trên đối tượng yêu cầu.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

## Giá trị

Một chuỗi. Có hai phiên bản của thuộc tính này mà bạn có thể lấy và đặt:

- Chuỗi rỗng, tức là `scriptElem.attributionSrc=""`. Điều này chỉ định rằng bạn muốn gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} đến cùng máy chủ mà thuộc tính `src` trỏ tới. Điều này ổn khi bạn xử lý việc đăng ký nguồn phân bổ hoặc kích hoạt phân bổ trên cùng một máy chủ. Khi đăng ký kích hoạt phân bổ, thuộc tính này là tùy chọn, và giá trị chuỗi rỗng sẽ được sử dụng nếu bị bỏ qua.
- Giá trị chứa một hoặc nhiều URL, ví dụ:

  ```js
  scriptElem.attributionSrc =
    "https://a.example/register-source https://b.example/register-source";
  ```

  Điều này hữu ích trong các trường hợp tài nguyên được yêu cầu không nằm trên máy chủ bạn kiểm soát, hoặc bạn chỉ muốn xử lý việc đăng ký nguồn phân bổ trên một máy chủ khác. Trong trường hợp này, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionSrc`. Khi yêu cầu tài nguyên xảy ra, tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi đến (các) URL được chỉ định trong `attributionSrc` cùng với origin của tài nguyên. Các URL đó có thể phản hồi với tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} để hoàn tất việc đăng ký.

  > [!NOTE]
  > Việc chỉ định nhiều URL có nghĩa là nhiều nguồn phân bổ có thể được đăng ký trên cùng một tính năng. Ví dụ, bạn có thể có nhiều chiến dịch khác nhau mà bạn đang cố đo lường mức độ thành công, liên quan đến việc tạo các báo cáo khác nhau về các dữ liệu khác nhau.

## Ví dụ

### Đặt attributionSrc rỗng

```html
<script src="advertising-script.js"></script>
```

```js
const scriptElem = document.querySelector("script");
scriptElem.attributionSrc = "";
```

### Đặt attributionSrc chứa URL

```html
<script src="advertising-script.js"></script>
```

```js
// mã hóa các URL phòng trường hợp chúng chứa ký tự đặc biệt
// như '=' mà có thể bị phân tích cú pháp không đúng.
const encodedUrlA = encodeURIComponent("https://a.example/register-source");
const encodedUrlB = encodeURIComponent("https://b.example/register-source");

const scriptElem = document.querySelector("script");
scriptElem.attributionSrc = `${encodedUrlA} ${encodedUrlB}`;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API).
