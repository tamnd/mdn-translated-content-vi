---
title: "IntersectionObserverEntry: hàm tạo IntersectionObserverEntry()"
short-title: IntersectionObserverEntry()
slug: Web/API/IntersectionObserverEntry/IntersectionObserverEntry
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.IntersectionObserverEntry.IntersectionObserverEntry
---

{{APIRef("Intersection Observer API")}}{{SeeCompatTable}}

Hàm tạo **`IntersectionObserverEntry()`** tạo và trả về một đối tượng {{domxref("IntersectionObserverEntry")}} mới.

> [!NOTE]
> Trong cách dùng thông thường, bạn không cần tự gọi hàm tạo này. Các đối tượng `IntersectionObserverEntry` được trình duyệt tạo tự động và chuyển đến callback {{domxref("IntersectionObserver")}} khi có giao nhau, hoặc được trả về bởi {{domxref("IntersectionObserver.takeRecords()")}}.

## Cú pháp

```js-nolint
new IntersectionObserverEntry(intersectionObserverEntryInit)
```

### Tham số

- `intersectionObserverEntryInit`
  - : Một đối tượng có các thuộc tính sau, tất cả đều bắt buộc:
    - `boundingClientRect`
      - : Đối tượng chỉ định vị trí và kích thước của hình chữ nhật biên của phần tử đích, với các thuộc tính `x`, `y`, `width`, và `height`. Đây là hình chữ nhật do {{domxref("Element.getBoundingClientRect()")}} trả về.
    - `intersectionRatio`
      - : Một số biểu thị tỷ lệ diện tích `intersectionRect` so với diện tích `boundingClientRect`. Nếu diện tích `boundingClientRect` bằng 0, giá trị này là 1 khi `isIntersecting` là `true`, và 0 nếu không.
    - `intersectionRect`
      - : Đối tượng chỉ định vị trí và kích thước vùng hiển thị của target trong hình chữ nhật giao nhau của root, với các thuộc tính `x`, `y`, `width`, và `height`.
    - `isIntersecting`
      - : Giá trị boolean là `true` nếu phần tử đích giao nhau với root của intersection observer, hoặc `false` nếu không.
    - `isVisible`
      - : Giá trị boolean là `true` nếu phần tử đích được xác định là hiển thị đầy đủ và không bị che khuất, không có hiệu ứng hình ảnh nào làm thay đổi cách nó hiển thị trên màn hình. `false` nghĩa là target có khả năng hiển thị bị ảnh hưởng, hoặc không thể xác định điều đó.
    - `rootBounds`
      - : Đối tượng chỉ định vị trí và kích thước của hình chữ nhật giao nhau của root, với các thuộc tính `x`, `y`, `width`, và `height`, hoặc `null`.
    - `target`
      - : {{domxref("Element")}} mà phần giao nhau với root đã thay đổi.
    - `time`
      - : Một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm thay đổi giao nhau được ghi nhận, tính tương đối với [time origin](/en-US/docs/Web/API/Performance/timeOrigin) của `IntersectionObserver`.

### Giá trị trả về

Một đối tượng {{domxref("IntersectionObserverEntry")}} mới với các thuộc tính được khởi tạo theo giá trị trong `intersectionObserverEntryInit`.

## Ví dụ

### Tạo IntersectionObserverEntry

Ví dụ này tạo một `IntersectionObserverEntry` cơ bản mô tả một phần tử hiển thị hoàn toàn. Trong thực tế, các đối tượng này do trình duyệt tạo và chuyển vào callback {{domxref("IntersectionObserver")}} tự động.

```js
const entry = new IntersectionObserverEntry({
  time: performance.now(),
  rootBounds: { x: 0, y: 0, width: 1024, height: 768 },
  boundingClientRect: { x: 10, y: 20, width: 200, height: 100 },
  intersectionRect: { x: 10, y: 20, width: 200, height: 100 },
  isIntersecting: true,
  isVisible: false,
  intersectionRatio: 1.0,
  target: document.body,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("IntersectionObserverEntry")}}
- {{domxref("IntersectionObserver")}}
- [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API)
