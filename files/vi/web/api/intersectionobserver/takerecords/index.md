---
title: "IntersectionObserver: takeRecords() method"
short-title: takeRecords()
slug: Web/API/IntersectionObserver/takeRecords
page-type: web-api-instance-method
browser-compat: api.IntersectionObserver.takeRecords
---

{{APIRef("Intersection Observer API")}}

Phương thức **`takeRecords()`** của giao diện {{domxref("IntersectionObserver")}} trả về một mảng các đối tượng {{domxref("IntersectionObserverEntry")}}, mỗi đối tượng dành cho mỗi phần tử đích đã trải qua thay đổi giao nhau kể từ lần cuối cùng các giao nhau được kiểm tra, hoặc là do gọi phương thức này một cách tường minh, hoặc là do lệnh gọi tự động đến callback của trình quan sát.

> [!NOTE]
> Nếu bạn sử dụng callback để giám sát các thay đổi này, bạn không cần gọi phương thức này.
> Việc gọi phương thức này sẽ xóa danh sách giao nhau đang chờ xử lý, vì vậy callback sẽ không được chạy.

## Cú pháp

```js-nolint
takeRecords()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("IntersectionObserverEntry")}}, mỗi đối tượng dành cho mỗi phần tử đích có giao nhau với gốc đã thay đổi kể từ lần cuối cùng các giao nhau được kiểm tra.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API)
