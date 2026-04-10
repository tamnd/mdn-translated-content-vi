---
title: MutationObserver
slug: Web/API/MutationObserver
page-type: web-api-interface
browser-compat: api.MutationObserver
---

{{APIRef("DOM WHATWG")}}

Giao diện **`MutationObserver`** cung cấp khả năng theo dõi các thay đổi được thực hiện trên cây [DOM](/en-US/docs/Web/API/Document_Object_Model). Nó được thiết kế để thay thế cho tính năng [Mutation Events](/en-US/docs/Web/API/MutationEvent) cũ hơn, vốn là một phần của đặc tả DOM3 Events.

## Constructor

- {{domxref("MutationObserver.MutationObserver", "MutationObserver()")}}
  - : Tạo và trả về một `MutationObserver` mới, sẽ gọi một hàm callback được chỉ định khi có thay đổi DOM xảy ra.

## Phương thức thể hiện

- {{domxref("MutationObserver.disconnect()", "disconnect()")}}
  - : Ngừng thể hiện `MutationObserver` nhận thêm thông báo cho đến khi và trừ khi {{domxref("MutationObserver.observe", "observe()")}} được gọi lại.
- {{domxref("MutationObserver.observe()", "observe()")}}
  - : Cấu hình `MutationObserver` để bắt đầu nhận thông báo thông qua hàm callback của nó khi các thay đổi DOM khớp với các tùy chọn đã cho xảy ra.
- {{domxref("MutationObserver.takeRecords()", "takeRecords()")}}
  - : Xóa tất cả thông báo đang chờ khỏi hàng đợi thông báo của `MutationObserver` và trả về chúng trong một {{jsxref("Array")}} mới gồm các đối tượng {{domxref("MutationRecord")}}.

## Ví dụ

Ví dụ sau được điều chỉnh từ [bài viết blog này](https://hacks.mozilla.org/2012/05/dom-mutationobserver-reacting-to-dom-changes-without-killing-browser-performance/).

```js
// Chọn nút sẽ được theo dõi để phát hiện biến đổi
const targetNode = document.getElementById("some-id");

// Tùy chọn cho observer (theo dõi những biến đổi nào)
const config = { attributes: true, childList: true, subtree: true };

// Hàm callback sẽ được thực thi khi phát hiện biến đổi
const callback = (mutationList, observer) => {
  for (const mutation of mutationList) {
    if (mutation.type === "childList") {
      console.log("Một nút con đã được thêm hoặc xóa.");
    } else if (mutation.type === "attributes") {
      console.log(`Thuộc tính ${mutation.attributeName} đã được sửa đổi.`);
    }
  }
};

// Tạo một thể hiện observer liên kết với hàm callback
const observer = new MutationObserver(callback);

// Bắt đầu theo dõi nút đích cho các biến đổi đã cấu hình
observer.observe(targetNode, config);

// Sau này, bạn có thể ngừng theo dõi
observer.disconnect();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('PerformanceObserver')}}
- {{domxref('ResizeObserver')}}
- {{domxref('IntersectionObserver')}}
- [Tổng quan ngắn gọn](https://developer.chrome.com/blog/detect-dom-changes-with-mutation-observers/)
- [Thảo luận chuyên sâu hơn](https://hacks.mozilla.org/2012/05/dom-mutationobserver-reacting-to-dom-changes-without-killing-browser-performance/)
- [Một screencast của nhà phát triển Chromium Rafael Weinstein](https://www.youtube.com/watch?v=eRZ4pO0gVWw)
