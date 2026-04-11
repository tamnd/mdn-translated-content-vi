---
title: "IntersectionObserver: observe() method"
short-title: observe()
slug: Web/API/IntersectionObserver/observe
page-type: web-api-instance-method
browser-compat: api.IntersectionObserver.observe
---

{{APIRef("Intersection Observer API")}}

Phương thức **`observe()`** của giao diện {{domxref("IntersectionObserver")}} thêm một phần tử vào tập hợp các phần tử đích đang được theo dõi bởi `IntersectionObserver`.
Một trình quan sát có một tập hợp ngưỡng và một gốc, nhưng có thể theo dõi nhiều phần tử đích để phát hiện thay đổi khả năng hiển thị theo các ngưỡng đó.

Để dừng quan sát phần tử, hãy gọi {{domxref("IntersectionObserver.unobserve()")}}.

Khi khả năng hiển thị của phần tử được chỉ định vượt qua một trong các ngưỡng hiển thị của trình quan sát (như liệt kê trong {{domxref("IntersectionObserver.thresholds")}}), callback của trình quan sát được thực thi với một mảng các đối tượng {{domxref("IntersectionObserverEntry")}} đại diện cho các thay đổi giao nhau đã xảy ra.
Lưu ý rằng thiết kế này cho phép nhiều thay đổi giao nhau của các phần tử được xử lý bởi một lần gọi callback duy nhất.

> [!NOTE]
> [Callback](/en-US/docs/Web/API/IntersectionObserver/IntersectionObserver#callback) của trình quan sát sẽ luôn kích hoạt ở chu kỳ render đầu tiên sau khi `observe()` được gọi, ngay cả khi phần tử được quan sát chưa di chuyển so với viewport.
> Điều này có nghĩa là, ví dụ, một phần tử nằm ngoài viewport khi `observe()` được gọi sẽ dẫn đến callback được gọi ngay lập tức với ít nhất một [mục](/en-US/docs/Web/API/IntersectionObserverEntry) có [`intersecting`](/en-US/docs/Web/API/IntersectionObserverEntry/isIntersecting) được đặt thành `false`.
> Một phần tử bên trong viewport sẽ dẫn đến callback được gọi ngay lập tức với ít nhất một mục có `intersecting` được đặt thành `true`.

## Cú pháp

```js-nolint
observe(targetElement)
```

### Tham số

- `targetElement`
  - : Một {{domxref("element")}} có khả năng hiển thị trong gốc cần được theo dõi.
    Phần tử này phải là phần tử con của phần tử gốc (hoặc nằm trong tài liệu hiện tại, nếu gốc là viewport của tài liệu).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Register IntersectionObserver
const io = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.intersectionRatio > 0) {
      // Add 'active' class if observation target is inside viewport
      entry.target.classList.add("active");
    } else {
      // Remove 'active' class otherwise
      entry.target.classList.remove("active");
    }
  });
});

// Declares what to observe, and observes its properties.
const boxElList = document.querySelectorAll(".box");
boxElList.forEach((el) => {
  io.observe(el);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("IntersectionObserver.unobserve()")}}
