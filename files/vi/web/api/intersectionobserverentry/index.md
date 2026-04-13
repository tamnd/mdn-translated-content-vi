---
title: IntersectionObserverEntry
slug: Web/API/IntersectionObserverEntry
page-type: web-api-interface
browser-compat: api.IntersectionObserverEntry
---

{{APIRef("Intersection Observer API")}}

Giao diện **`IntersectionObserverEntry`** của [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API) mô tả phần giao nhau giữa phần tử đích và vùng chứa root của nó tại một thời điểm chuyển trạng thái cụ thể.

Các thể hiện `IntersectionObserverEntry` được chuyển vào đối số `entries` của callback {{domxref("IntersectionObserver")}}; ngoài ra, các đối tượng này chỉ có thể nhận được bằng cách gọi {{domxref("IntersectionObserver.takeRecords()")}}.

## Hàm tạo

- {{domxref("IntersectionObserverEntry.IntersectionObserverEntry", "IntersectionObserverEntry()")}} {{experimental_inline}}
  - : Tạo một đối tượng `IntersectionObserverEntry` mới.

## Thuộc tính thể hiện

- {{domxref("IntersectionObserverEntry.boundingClientRect")}} {{ReadOnlyInline}}
  - : Trả về hình chữ nhật biên của phần tử đích dưới dạng {{domxref("DOMRectReadOnly")}}. Các biên này được tính như mô tả trong tài liệu của {{domxref("Element.getBoundingClientRect()")}}.
- {{domxref("IntersectionObserverEntry.intersectionRatio")}} {{ReadOnlyInline}}
  - : Trả về tỷ lệ giữa `intersectionRect` và `boundingClientRect`.
- {{domxref("IntersectionObserverEntry.intersectionRect")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMRectReadOnly")}} biểu diễn vùng hiển thị của target.
- {{domxref("IntersectionObserverEntry.isIntersecting")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean là `true` nếu phần tử đích giao nhau với root của intersection observer. Nếu là `true`, `IntersectionObserverEntry` mô tả một chuyển đổi vào trạng thái giao nhau; nếu là `false`, bạn biết rằng nó đã chuyển từ giao nhau sang không giao nhau.
- {{domxref("IntersectionObserverEntry.rootBounds")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMRectReadOnly")}} cho root của intersection observer.
- {{domxref("IntersectionObserverEntry.target")}} {{ReadOnlyInline}}
  - : {{domxref("Element")}} mà phần giao nhau với root đã thay đổi.
- {{domxref("IntersectionObserverEntry.time")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm phần giao nhau được ghi nhận, tính tương đối với [time origin](/en-US/docs/Web/API/Performance/timeOrigin) của `IntersectionObserver`.

## Phương thức thể hiện

_Giao diện này không có phương thức nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
