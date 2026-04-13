---
title: PerformanceElementTiming
slug: Web/API/PerformanceElementTiming
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PerformanceElementTiming
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Giao diện **`PerformanceElementTiming`** chứa thông tin thời gian render cho các phần tử hình ảnh và nút văn bản mà nhà phát triển đã chú thích bằng thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) để quan sát.

## Mô tả

Mục tiêu của Element Timing API là cung cấp cho các nhà phát triển web hoặc các công cụ phân tích khả năng đo các dấu thời gian render của các phần tử quan trọng trên một trang.

API hỗ trợ thông tin thời gian trên các phần tử sau:

- Các phần tử {{htmlelement("img")}},
- Các phần tử {{SVGElement("image")}} bên trong {{SVGElement("svg")}},
- Hình ảnh [poster](/en-US/docs/Web/HTML/Reference/Elements/video#poster) của các phần tử {{htmlelement("video")}},
- Các phần tử có thuộc tính {{cssxref("background-image")}} chứa nội dung với giá trị URL cho tài nguyên thực sự có sẵn, và
- Các nhóm nút văn bản, chẳng hạn như {{htmlelement("p")}}.

Tác giả đánh dấu một phần tử để quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) trên phần tử đó.

`PerformanceElementTiming` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này trực tiếp định nghĩa các thuộc tính sau:

- {{domxref("PerformanceElementTiming.element")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("Element")}} đại diện cho phần tử mà chúng ta đang trả về thông tin.
- {{domxref("PerformanceElementTiming.id")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử.
- {{domxref("PerformanceElementTiming.identifier")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi là giá trị của thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/for) trên phần tử.
- {{domxref("PerformanceElementTiming.intersectionRect")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMRectReadOnly")}} là hình chữ nhật của phần tử trong viewport.
- {{domxref("PerformanceElementTiming.loadTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} với loadTime của phần tử.
- {{domxref("PerformanceElementTiming.naturalHeight")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số nguyên không dấu 32-bit (unsigned long) là chiều cao nội tại của hình ảnh nếu áp dụng cho hình ảnh, 0 cho văn bản.
- {{domxref("PerformanceElementTiming.naturalWidth")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số nguyên không dấu 32-bit (unsigned long) là chiều rộng nội tại của hình ảnh nếu áp dụng cho hình ảnh, 0 cho văn bản.
- {{domxref("PerformanceElementTiming.paintTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi giai đoạn render kết thúc và giai đoạn vẽ bắt đầu.
- {{domxref("PerformanceElementTiming.presentationTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","dấu thời gian")}} khi phần tử thực sự được vẽ trên màn hình.
- {{domxref("PerformanceElementTiming.renderTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} với renderTime của phần tử.
- {{domxref("PerformanceElementTiming.url")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi là URL ban đầu của yêu cầu tài nguyên cho hình ảnh, 0 cho văn bản.

Giao diện này cũng mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau, với các điều kiện và hạn chế như được mô tả:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `0` vì `duration` không áp dụng cho giao diện này.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `"element"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `"image-paint"` cho hình ảnh và `"text-paint"` cho văn bản.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị {{domxref("PerformanceElementTiming.renderTime", "renderTime")}} của mục này nếu nó không phải `0`, nếu không trả về giá trị {{domxref("PerformanceElementTiming.loadTime", "loadTime")}} của mục này.

## Phương thức phiên bản

- {{domxref("PerformanceElementTiming.toJSON()")}} {{Experimental_Inline}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceElementTiming`.

## Ví dụ

### Quan sát thời gian render của các phần tử cụ thể

Trong ví dụ này, hai phần tử đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo.

```html
<img src="image.jpg" elementtiming="big-image" />
<p elementtiming="text" id="text-id">text here</p>
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry);
  });
});
observer.observe({ type: "element", buffered: true });
```

Hai mục sẽ được xuất ra console. Mục đầu tiên chứa thông tin chi tiết về hình ảnh, mục thứ hai chứa thông tin chi tiết về nút văn bản.

### Quan sát thời gian vẽ và trình bày riêng biệt

Các thuộc tính `paintTime` và `presentationTime` cho phép bạn truy xuất các thời gian cụ thể cho thời điểm giai đoạn vẽ bắt đầu và phần tử được vẽ trên màn hình. `paintTime` có tính tương thích rộng rãi, trong khi `presentationTime` phụ thuộc vào từng triển khai cụ thể.

Ví dụ này sử dụng `PerformanceObserver` để quan sát tất cả các mục hiệu suất loại `"element"` (nhớ rằng, để được quan sát, các phần tử cần có thuộc tính `elementtiming` được đặt trên chúng). Chúng ta kiểm tra hỗ trợ `paintTime` và `presentationTime` và truy xuất các giá trị đó nếu có. Trong các trình duyệt không hỗ trợ, mã sẽ truy xuất `renderTime` hoặc `loadTime`, tùy thuộc vào cái nào được hỗ trợ.

```js
const observer = new PerformanceObserver((list) => {
  const entries = list.getEntries();
  entries.forEach((entry) => {
    if (entry.presentationTime) {
      console.log(
        "Element paintTime:",
        entry.paintTime,
        "Element presentationTime:",
        entry.presentationTime,
      );
    } else if (entry.paintTime) {
      console.log("Element paintTime:", entry.paintTime);
    } else if (entry.renderTime) {
      console.log("Element renderTime:", entry.renderTime);
    } else {
      console.log("Element loadTime", entry.loadTime);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming)
