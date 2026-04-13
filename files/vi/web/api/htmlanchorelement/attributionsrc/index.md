---
title: "HTMLAnchorElement: thuộc tính attributionSrc"
short-title: attributionSrc
slug: Web/API/HTMLAnchorElement/attributionSrc
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.HTMLAnchorElement.attributionSrc
---

{{APIRef("Attribution Reporting API")}}{{securecontext_header}}{{deprecated_header}}

Thuộc tính **`attributionSrc`** của giao diện {{domxref("HTMLAnchorElement")}} lấy và đặt thuộc tính [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/a#attributionsrc) trên một phần tử {{htmlelement("a")}} một cách lập trình, phản ánh giá trị của thuộc tính đó. `attributionsrc` chỉ định rằng bạn muốn trình duyệt gửi một tiêu đề {{httpheader("Attribution-Reporting-Eligible")}}. Ở phía máy chủ, điều này được dùng để kích hoạt việc gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} trong phản hồi, nhằm đăng ký một [nguồn quy kết dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources).

Trình duyệt lưu trữ dữ liệu nguồn liên quan đến nguồn quy kết dựa trên điều hướng (được cung cấp trong tiêu đề phản hồi {{httpheader("Attribution-Reporting-Register-Source")}}) khi nhận được phản hồi điều hướng.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

> [!NOTE]
> Các phần tử `<a>` không thể được sử dụng làm trình kích hoạt quy kết, chỉ có thể là nguồn.

## Giá trị

Một chuỗi. Có hai phiên bản của thuộc tính này mà bạn có thể lấy và đặt:

- Chuỗi rỗng, tức là `aElem.attributionSrc=""`. Điều này chỉ định rằng bạn muốn tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} được gửi đến cùng máy chủ mà thuộc tính `href` trỏ đến. Điều này phù hợp khi bạn đang xử lý việc đăng ký nguồn quy kết trên cùng một máy chủ.
- Giá trị chứa một hoặc nhiều URL, ví dụ:

  ```js
  aElem.attributionSrc =
    "https://a.example/register-source https://b.example/register-source";
  ```

  Điều này hữu ích trong trường hợp tài nguyên được yêu cầu không nằm trên máy chủ bạn kiểm soát, hoặc bạn chỉ muốn xử lý việc đăng ký nguồn quy kết trên một máy chủ khác. Trong trường hợp này, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionSrc`. Khi yêu cầu tài nguyên xảy ra, tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi đến (các) URL được chỉ định trong `attributionSrc` ngoài nguồn gốc tài nguyên. Các URL này sau đó có thể phản hồi bằng một {{httpheader("Attribution-Reporting-Register-Source")}} để đăng ký nguồn.

  > [!NOTE]
  > Việc chỉ định nhiều URL có nghĩa là nhiều nguồn quy kết có thể được đăng ký trên cùng một tính năng. Bạn có thể có các chiến dịch khác nhau mà bạn đang cố gắng đo lường mức độ thành công, liên quan đến việc tạo các báo cáo khác nhau trên các dữ liệu khác nhau.

## Ví dụ

### Đặt một attributionSrc rỗng

```html
<a href="https://shop.example"> Nhấp để ghé thăm cửa hàng của chúng tôi </a>
```

```js
const aElem = document.querySelector("a");
aElem.attributionSrc = "";
```

### Đặt attributionSrc chứa các URL

```html
<a href="https://ourshop.example"> Nhấp để ghé thăm cửa hàng của chúng tôi </a>
```

```js
// mã hóa các URL trong trường hợp chúng chứa ký tự đặc biệt
// chẳng hạn như '=' sẽ bị phân tích cú pháp không chính xác.
const encodedUrlA = encodeURIComponent("https://a.example/register-source");
const encodedUrlB = encodeURIComponent("https://b.example/register-source");

const aElem = document.querySelector("a");
aElem.attributionSrc = `${encodedUrlA} ${encodedUrlB}`;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API).
