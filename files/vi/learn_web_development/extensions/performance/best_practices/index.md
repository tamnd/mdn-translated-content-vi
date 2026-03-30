---
title: Các phương pháp hay nhất & mẹo về hiệu suất web
short-title: Phương pháp hay nhất & mẹo
slug: Learn_web_development/Extensions/Performance/Best_practices
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Performance/business_case_for_performance", "Learn_web_development/Extensions/Performance")}}

Có nhiều [lý do](https://web.dev/learn/performance/why-speed-matters) tại sao trang web của bạn nên hoạt động tốt nhất có thể.
Dưới đây là đánh giá nhanh về các phương pháp hay nhất, công cụ, API với các liên kết để cung cấp thêm thông tin về từng chủ đề.

## Phương pháp hay nhất

- Bắt đầu bằng cách học [đường dẫn kết xuất quan trọng](/en-US/docs/Web/Performance/Guides/Critical_rendering_path) của trình duyệt. Biết điều này sẽ giúp bạn hiểu cách cải thiện hiệu suất của trang web.
- Sử dụng _resource hints_ như [`rel=preconnect`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect), [`rel=dns-prefetch`](/en-US/docs/Web/HTML/Reference/Attributes/rel/dns-prefetch), [`rel=prefetch`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch), [`rel=preload`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload).
- Giữ kích thước JavaScript ở mức [tối thiểu](https://medium.com/@addyosmani/the-cost-of-javascript-in-2018-7d8950fbb5d4). Chỉ sử dụng nhiều JavaScript như cần thiết cho trang hiện tại.
- Các yếu tố hiệu suất [CSS](/en-US/docs/Learn_web_development/Extensions/Performance/CSS)
- Sử dụng {{Glossary("HTTP_2", "HTTP/2")}} trên server của bạn (hoặc CDN).
- Sử dụng CDN cho các tài nguyên có thể giảm đáng kể thời gian tải.
- Nén các tài nguyên của bạn bằng cách sử dụng [gzip](https://www.gnu.org/software/gzip/), [Brotli](https://github.com/google/brotli) và [Zopfli](https://github.com/google/zopfli).
- Tối ưu hóa hình ảnh (sử dụng hoạt ảnh CSS hoặc SVG nếu có thể).
- Tải lười các phần của ứng dụng bên ngoài viewport. Nếu bạn làm vậy, hãy có kế hoạch dự phòng cho SEO (ví dụ, kết xuất trang đầy đủ cho lưu lượng bot); ví dụ, bằng cách sử dụng thuộc tính [`loading`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) trên phần tử {{HTMLElement("img")}}, hoặc tương tự trên các phần tử {{HTMLElement("iframe")}}, {{HTMLElement("video")}}, {{HTMLElement("audio")}}.
- Cũng rất quan trọng là nhận ra những gì thực sự quan trọng với người dùng của bạn. Nó có thể không phải là thời gian tuyệt đối, mà là [nhận thức của người dùng](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance).

## Thắng nhanh

### CSS

Hiệu suất web là tất cả về trải nghiệm người dùng và hiệu suất cảm nhận. Như chúng ta đã học trong tài liệu [đường dẫn kết xuất quan trọng](/en-US/docs/Web/Performance/Guides/Critical_rendering_path), việc liên kết CSS với thẻ link truyền thống với `rel="stylesheet"` là đồng bộ và chặn kết xuất. Tối ưu hóa việc kết xuất trang của bạn bằng cách loại bỏ CSS chặn.

Để tải CSS không đồng bộ, người ta có thể đặt loại media thành `print` và sau đó thay đổi thành `all` sau khi tải. Điều này yêu cầu JavaScript, vì vậy quan trọng là bao gồm thẻ `<noscript>` với fallback truyền thống.

```html
<link
  id="my-stylesheet"
  rel="stylesheet"
  href="/path/to/my.css"
  media="print" />
<noscript><link rel="stylesheet" href="/path/to/my.css" /></noscript>
```

```js
const stylesheet = document.getElementById("my-stylesheet");
stylesheet.addEventListener("load", () => {
  stylesheet.media = "all";
});
```

Nhược điểm của cách tiếp cận này là hiện tượng nhấp nháy văn bản chưa tạo kiểu (FOUT). Cách đơn giản nhất để giải quyết điều này là bằng cách nội tuyến CSS cần thiết cho bất kỳ nội dung nào được kết xuất trên nếp gập trên, hoặc những gì bạn thấy trong viewport trình duyệt trước khi cuộn. Những kiểu này sẽ cải thiện hiệu suất cảm nhận vì CSS không yêu cầu yêu cầu tệp.

```html
<style>
  /* Insert your CSS here */
</style>
```

### JavaScript

Tránh JavaScript chặn bằng cách sử dụng thuộc tính [`async`](/en-US/docs/Web/HTML/Reference/Elements/script) hoặc [`defer`](/en-US/docs/Web/HTML/Reference/Elements/script), hoặc liên kết các tài nguyên JavaScript sau các phần tử DOM của trang. JavaScript chỉ chặn kết xuất cho các phần tử xuất hiện sau thẻ script trong cây DOM.

### Phông chữ web

Định dạng EOT và TTF không được nén theo mặc định. Áp dụng nén như GZIP hoặc Brotli cho các loại tệp này. Sử dụng WOFF và WOFF2. Những định dạng này có tích hợp nén.

Trong @font-face sử dụng font-display: swap. Bằng cách sử dụng font display swap, trình duyệt sẽ không chặn kết xuất và sẽ sử dụng các phông chữ hệ thống dự phòng được định nghĩa. Tối ưu hóa [font weight](/en-US/docs/Web/CSS/Reference/Properties/font-weight) để khớp với phông chữ web càng gần càng tốt.

#### Phông chữ web biểu tượng

Nếu có thể, tránh phông chữ web biểu tượng và sử dụng SVG nén. Để tối ưu hóa hơn nữa, hãy nội tuyến dữ liệu SVG trong đánh dấu HTML để tránh các yêu cầu HTTP.

## Công cụ

- Học cách sử dụng [Firefox Dev Tools](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html) để phân tích trang web của bạn.
- [PageSpeed Insights](https://pagespeed.web.dev/) có thể phân tích trang của bạn và cung cấp một số gợi ý chung để cải thiện hiệu suất.
- [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview/) có thể cung cấp cho bạn sự phân tích chi tiết về nhiều khía cạnh của trang web bao gồm hiệu suất, SEO và khả năng tiếp cận.
- Kiểm tra tốc độ trang của bạn bằng cách sử dụng [WebPageTest.org](https://www.webpagetest.org/), nơi bạn có thể sử dụng các loại thiết bị thực và vị trí khác nhau.
- Thử [Chrome User Experience Report](https://developer.chrome.com/docs/crux/) để định lượng các số liệu người dùng thực.
- Xác định [ngân sách hiệu suất](/en-US/docs/Web/Performance/Guides/Performance_budgets).

### API

- Thu thập số liệu người dùng bằng thư viện [boomerang](https://github.com/akamai/boomerang).
- Hoặc thu thập trực tiếp với [window.performance.timing](/en-US/docs/Web/API/Performance/timing)

### Những điều không nên làm (phương pháp xấu)

- Tải xuống mọi thứ
- Sử dụng các tệp phương tiện chưa nén

## Xem thêm

- <https://github.com/filamentgroup/loadCSS>
