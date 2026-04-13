---
title: IntersectionObserver
slug: Web/API/IntersectionObserver
page-type: web-api-interface
browser-compat: api.IntersectionObserver
---

{{APIRef("Intersection Observer API")}}

Giao diện **`IntersectionObserver`** thuộc [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API) cung cấp một cách để quan sát không đồng bộ các thay đổi trong sự giao nhau của một phần tử đích với một phần tử tổ tiên hoặc với {{Glossary('viewport')}} của tài liệu cấp cao nhất. Phần tử tổ tiên hoặc viewport được gọi là gốc (root).

Khi một `IntersectionObserver` được tạo ra, nó được cấu hình để theo dõi các tỷ lệ hiển thị nhất định trong phần tử gốc. Cấu hình không thể thay đổi sau khi `IntersectionObserver` được tạo, vì vậy một đối tượng trình quan sát chỉ hữu ích cho việc theo dõi các thay đổi cụ thể về mức độ hiển thị; tuy nhiên, bạn có thể theo dõi nhiều phần tử đích với cùng một trình quan sát.

## Hàm khởi tạo

- {{domxref("IntersectionObserver.IntersectionObserver", "IntersectionObserver()")}}
  - : Tạo một đối tượng `IntersectionObserver` mới, đối tượng này sẽ thực thi một hàm callback được chỉ định khi phát hiện khả năng hiển thị của một phần tử đích đã vượt qua một hoặc nhiều ngưỡng.

## Thuộc tính phiên bản

- {{domxref("IntersectionObserver.delay")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một số nguyên cho biết độ trễ tối thiểu giữa các thông báo từ trình quan sát này.
- {{domxref("IntersectionObserver.root")}} {{ReadOnlyInline}}
  - : {{domxref("Element")}} hoặc {{domxref("Document")}} có ranh giới được dùng làm hộp giới hạn khi kiểm tra sự giao nhau. Nếu không có giá trị `root` nào được truyền vào hàm khởi tạo hoặc giá trị là `null`, thì viewport của tài liệu cấp cao nhất sẽ được sử dụng.
- {{domxref("IntersectionObserver.rootMargin")}} {{ReadOnlyInline}}
  - : Một hình chữ nhật dịch chuyển được áp dụng vào {{Glossary('bounding box')}} của gốc khi tính toán sự giao nhau, giúp thu nhỏ hoặc mở rộng gốc cho mục đích tính toán. Giá trị được trả về bởi thuộc tính này có thể không giống với giá trị được chỉ định khi gọi hàm khởi tạo vì nó có thể được thay đổi để phù hợp với các yêu cầu nội bộ. Mỗi độ lệch có thể được biểu thị bằng pixel (`px`) hoặc phần trăm (`%`). Giá trị mặc định là "0px 0px 0px 0px".
- {{domxref("IntersectionObserver.scrollMargin")}} {{ReadOnlyInline}}
  - : Một hình chữ nhật dịch chuyển được áp dụng vào mỗi {{glossary("scroll container")}} trên đường dẫn từ gốc giao nhau đến đích, giúp thu nhỏ hoặc mở rộng các hình chữ nhật cắt xén được dùng để tính toán sự giao nhau.
    Giá trị được trả về bởi thuộc tính này có thể không giống với giá trị được chỉ định khi gọi hàm khởi tạo.
- {{domxref("IntersectionObserver.thresholds")}} {{ReadOnlyInline}}
  - : Danh sách các ngưỡng, được sắp xếp theo thứ tự số tăng dần, trong đó mỗi ngưỡng là tỷ lệ diện tích giao nhau so với diện tích hộp giới hạn của một đích được quan sát. Thông báo cho một đích sẽ được tạo ra khi bất kỳ ngưỡng nào bị vượt qua đối với đích đó. Nếu không có giá trị nào được truyền vào hàm khởi tạo, thì 0 sẽ được sử dụng.
- {{domxref("IntersectionObserver.trackVisibility")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một giá trị boolean cho biết liệu `IntersectionObserver` này có đang kiểm tra xem đích có bị suy giảm khả năng hiển thị hay không.

## Phương thức phiên bản

- {{domxref("IntersectionObserver.disconnect()")}}
  - : Dừng đối tượng `IntersectionObserver` không quan sát bất kỳ đích nào.
- {{domxref("IntersectionObserver.observe()")}}
  - : Yêu cầu `IntersectionObserver` quan sát một phần tử đích.
- {{domxref("IntersectionObserver.takeRecords()")}}
  - : Trả về một mảng các đối tượng {{domxref("IntersectionObserverEntry")}} cho tất cả các đích được quan sát.
- {{domxref("IntersectionObserver.unobserve()")}}
  - : Yêu cầu `IntersectionObserver` ngừng quan sát một phần tử đích cụ thể.

## Ví dụ

```js
const intersectionObserver = new IntersectionObserver((entries) => {
  // If intersectionRatio is 0, the target is out of view
  // and we do not need to do anything.
  if (entries[0].intersectionRatio <= 0) return;

  loadItems(10);
  console.log("Loaded new items");
});
// start observing
intersectionObserver.observe(document.querySelector(".scrollerFooter"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('MutationObserver')}}
- {{domxref('PerformanceObserver')}}
- {{domxref('ResizeObserver')}}
