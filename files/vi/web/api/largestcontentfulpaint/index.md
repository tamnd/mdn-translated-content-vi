---
title: LargestContentfulPaint
slug: Web/API/LargestContentfulPaint
page-type: web-api-interface
browser-compat: api.LargestContentfulPaint
---

{{APIRef("Performance API")}}

Giao diện `LargestContentfulPaint` cung cấp thông tin thời gian về lần vẽ hình ảnh hoặc văn bản lớn nhất trước khi người dùng nhập liệu trên trang web.

## Mô tả

Thời điểm quan trọng mà API này cung cấp là chỉ số {{Glossary("Largest Contentful Paint")}} (LCP). Nó cung cấp thời gian hiển thị của hình ảnh hoặc khối văn bản lớn nhất hiển thị trong vùng nhìn, được ghi từ khi trang bắt đầu tải. Các phần tử sau được xem xét khi xác định LCP:

- Các phần tử {{HTMLElement("img")}}.
- Các phần tử [`<image>`](/en-US/docs/Web/SVG/Reference/Element/image) bên trong SVG.
- Hình ảnh poster của các phần tử {{HTMLElement("video")}}.
- Các phần tử có {{cssxref("background-image")}}.
- Các nhóm nút văn bản như {{HTMLElement("p")}}.

Để đo thời gian hiển thị của các phần tử khác, hãy dùng API {{domxref("PerformanceElementTiming")}}.

Các thời điểm vẽ quan trọng bổ sung được cung cấp bởi API {{domxref("PerformancePaintTiming")}}:

- {{Glossary("First Paint")}} (FP): Thời điểm bất kỳ nội dung nào được hiển thị. Lưu ý rằng việc đánh dấu lần vẽ đầu tiên là tùy chọn, không phải tất cả tác nhân người dùng đều báo cáo nó.
- {{Glossary("First Contentful Paint")}} (FCP): Thời điểm bit đầu tiên của văn bản hoặc hình ảnh DOM được hiển thị.

`LargestContentfulPaint` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

Để đo chính xác thời gian hiển thị của tài nguyên từ nguồn gốc chéo, hãy đặt tiêu đề {{httpheader("Timing-Allow-Origin")}}.

Xem [Thời gian hiển thị hình ảnh nguồn gốc chéo](/en-US/docs/Web/API/LargestContentfulPaint/renderTime#cross-origin_image_render_time) và [Dùng startTime thay vì renderTime](/en-US/docs/Web/API/LargestContentfulPaint/renderTime#use_starttime_over_rendertime) để biết thêm chi tiết.

## Thuộc tính phiên bản

Giao diện này trực tiếp định nghĩa các thuộc tính sau:

- {{domxref("LargestContentfulPaint.element")}} {{ReadOnlyInline}}
  - : Phần tử hiện là lần vẽ nội dung lớn nhất.
- {{domxref("LargestContentfulPaint.renderTime")}} {{ReadOnlyInline}}
  - : Thời điểm phần tử được hiển thị trên màn hình. Có thể là giá trị được làm thô nếu phần tử là hình ảnh từ nguồn gốc chéo được tải mà không có tiêu đề `Timing-Allow-Origin`.
- {{domxref("LargestContentfulPaint.loadTime")}} {{ReadOnlyInline}}
  - : Thời điểm phần tử được tải.
- {{domxref("LargestContentfulPaint.size")}} {{ReadOnlyInline}}
  - : Kích thước nội tại của phần tử được trả về dưới dạng diện tích (rộng \* cao).
- {{domxref("LargestContentfulPaint.id")}} {{ReadOnlyInline}}
  - : ID của phần tử. Thuộc tính này trả về chuỗi rỗng khi không có ID.
- {{domxref("LargestContentfulPaint.paintTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi giai đoạn hiển thị kết thúc và giai đoạn vẽ bắt đầu.
- {{domxref("LargestContentfulPaint.presentationTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi các điểm ảnh được vẽ thực sự xuất hiện trên màn hình.
- {{domxref("LargestContentfulPaint.url")}} {{ReadOnlyInline}}
  - : Nếu phần tử là hình ảnh, URL yêu cầu của hình ảnh đó.

Nó cũng mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau, giới hạn và ràng buộc chúng như được mô tả:

- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `"largest-contentful-paint"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về chuỗi rỗng.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị của {{domxref("LargestContentfulPaint.renderTime", "renderTime")}} của mục này.
- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `0`, vì `duration` không áp dụng cho giao diện này.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("PerformanceEntry")}}._

- {{domxref("LargestContentfulPaint.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `LargestContentfulPaint`.

## Ví dụ

### Quan sát lần vẽ nội dung lớn nhất

Trong ví dụ sau, một {{domxref("PerformanceObserver")}} được đăng ký để lấy lần vẽ nội dung lớn nhất trong khi trang đang tải. Cờ `buffered` được dùng để truy cập dữ liệu trước khi tạo observer.

API LCP phân tích tất cả nội dung tìm thấy (bao gồm nội dung bị xóa khỏi DOM). Khi tìm thấy nội dung lớn hơn, nó tạo một mục mới. Nó dừng tìm kiếm nội dung lớn hơn khi xảy ra sự kiện cuộn hoặc nhập liệu, vì các sự kiện này có thể giới thiệu nội dung mới trên trang web. Do đó LCP là mục hiệu suất cuối cùng được báo cáo bởi observer.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  console.log("LCP:", lastEntry.startTime);
  console.log(lastEntry);
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

### Quan sát thời gian vẽ và trình bày riêng biệt

Các thuộc tính `paintTime` và `presentationTime` cho phép bạn lấy thời gian cụ thể khi giai đoạn vẽ bắt đầu và khi các điểm ảnh được vẽ xuất hiện trên màn hình. `paintTime` có khả năng tương thích rộng rãi, trong khi `presentationTime` phụ thuộc vào triển khai.

Ví dụ này dựa trên ví dụ observer trước đó, cho thấy cách kiểm tra hỗ trợ cho `paintTime` và `presentationTime` rồi lấy các giá trị đó nếu có. Trong các trình duyệt không hỗ trợ, mã lấy `renderTime` hoặc `loadTime`, tùy thuộc vào cái nào được hỗ trợ.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  const lastEntry = entries[entries.length - 1]; // Dùng ứng viên LCP mới nhất
  if (lastEntry.presentationTime) {
    console.log(
      "LCP paintTime:",
      lastEntry.paintTime,
      "LCP presentationTime:",
      lastEntry.presentationTime,
    );
  } else if (lastEntry.paintTime) {
    console.log("LCP paintTime:", lastEntry.paintTime);
  } else if (lastEntry.renderTime) {
    console.log("LCP renderTime:", lastEntry.renderTime);
  } else {
    console.log("LCP loadTime:", lastEntry.loadTime);
  }
});
observer.observe({ type: "largest-contentful-paint", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Glossary("Largest Contentful Paint")}}
- {{Glossary("First Contentful Paint")}}
- {{Glossary("First Paint")}}
