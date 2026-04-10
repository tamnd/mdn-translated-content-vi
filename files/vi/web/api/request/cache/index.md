---
title: "Request: thuộc tính cache"
short-title: cache
slug: Web/API/Request/cache
page-type: web-api-instance-property
browser-compat: api.Request.cache
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`cache`** của giao diện {{domxref("Request")}} chứa chế độ cache của request. Nó điều khiển cách request tương tác với [HTTP cache](/en-US/docs/Web/HTTP/Guides/Caching) của trình duyệt.

## Giá trị

Một giá trị `RequestCache`. Các giá trị khả dụng là:

- `default` - Trình duyệt tìm một request khớp trong HTTP cache của nó.
  - Nếu có khớp và còn [fresh](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age), nó sẽ được trả về từ cache.
  - Nếu có khớp nhưng đã [stale](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age), trình duyệt sẽ thực hiện một [conditional request](/en-US/docs/Web/HTTP/Guides/Conditional_requests) tới máy chủ từ xa. Nếu máy chủ cho biết tài nguyên chưa thay đổi, nó sẽ được trả về từ cache. Nếu không, tài nguyên sẽ được tải từ máy chủ và cache sẽ được cập nhật.
  - Nếu không có khớp, trình duyệt sẽ thực hiện một request bình thường và cập nhật cache với tài nguyên đã tải xuống.

- `no-store` - Trình duyệt lấy tài nguyên từ máy chủ từ xa mà không tra cache trước, và _sẽ không_ cập nhật cache với tài nguyên đã tải xuống.
- `reload` - Trình duyệt lấy tài nguyên từ máy chủ từ xa mà không tra cache trước, nhưng sau đó _sẽ_ cập nhật cache với tài nguyên đã tải xuống.
- `no-cache` - Trình duyệt tìm một request khớp trong HTTP cache của nó.
  - Nếu có khớp, _dù fresh hay stale_, trình duyệt sẽ thực hiện một [conditional request](/en-US/docs/Web/HTTP/Guides/Conditional_requests) tới máy chủ từ xa. Nếu máy chủ cho biết tài nguyên chưa thay đổi, nó sẽ được trả về từ cache. Nếu không, tài nguyên sẽ được tải từ máy chủ và cache sẽ được cập nhật.
  - Nếu không có khớp, trình duyệt sẽ thực hiện một request bình thường và cập nhật cache với tài nguyên đã tải xuống.

- `force-cache` - Trình duyệt tìm một request khớp trong HTTP cache của nó.
  - Nếu có khớp, _dù fresh hay stale_, nó sẽ được trả về từ cache.
  - Nếu không có khớp, trình duyệt sẽ thực hiện một request bình thường và cập nhật cache với tài nguyên đã tải xuống.

- `only-if-cached` - Trình duyệt tìm một request khớp trong HTTP cache của nó. {{experimental_inline}}
  - Nếu có khớp, _dù fresh hay stale_, nó sẽ được trả về từ cache.
  - Nếu không có khớp, trình duyệt sẽ trả về trạng thái [504 Gateway timeout](/en-US/docs/Web/HTTP/Reference/Status/504).

  Chế độ `"only-if-cached"` chỉ có thể dùng nếu [`mode`](/en-US/docs/Web/API/Request/mode) của request là `"same-origin"`. Các redirect đã cache sẽ được theo nếu thuộc tính `redirect` của request là `"follow"` và các redirect đó không vi phạm chế độ `"same-origin"`.

## Ví dụ

```js
// Tải một tài nguyên với cache busting để bỏ qua cache hoàn toàn.
fetch("some.json", { cache: "no-store" }).then((response) => {
  /* xử lý response */
});

// Tải một tài nguyên với cache busting, nhưng cập nhật HTTP cache
// bằng tài nguyên vừa tải.
fetch("some.json", { cache: "reload" }).then((response) => {
  /* xử lý response */
});

// Tải một tài nguyên với cache busting khi làm việc với
// một máy chủ được cấu hình đúng, gửi ETag và Date chính xác
// và xử lý đúng If-Modified-Since và If-None-Match,
// nhờ đó có thể dựa vào xác thực để đảm bảo phản hồi mới.
fetch("some.json", { cache: "no-cache" }).then((response) => {
  /* xử lý response */
});

// Tải một tài nguyên với tư duy tiết kiệm! Ưu tiên phản hồi
// đã cache dù hơi cũ để tiết kiệm băng thông tối đa.
fetch("some.json", { cache: "force-cache" }).then((response) => {
  /* xử lý response */
});

// Triển khai stale-while-revalidate ở cấp client một cách đơn giản.
// Ưu tiên phản hồi đã cache, dù hơi cũ; nhưng cập nhật nếu nó đã quá cũ.
// AbortController và signal giúp dọn bộ nhớ tốt hơn.
// Trên thực tế, đây sẽ là một hàm nhận đường dẫn và một tham chiếu
// đến controller vì nó cần thay đổi giá trị
let controller = new AbortController();
fetch("some.json", {
  cache: "only-if-cached",
  mode: "same-origin",
  signal: controller.signal,
})
  .catch((e) =>
    e instanceof TypeError && e.message === "Failed to fetch"
      ? { status: 504 } // Cách xử lý cho chrome; nơi này trả về TypeError
      : Promise.reject(e),
  )
  .then((res) => {
    if (res.status === 504) {
      controller.abort();
      controller = new AbortController();
      return fetch("some.json", {
        cache: "force-cache",
        mode: "same-origin",
        signal: controller.signal,
      });
    }
    const date = res.headers.get("date"),
      dt = date ? new Date(date).getTime() : 0;
    if (dt < Date.now() - 86_400_000) {
      // nếu cũ hơn 24 giờ
      controller.abort();
      controller = new AbortController();
      return fetch("some.json", {
        cache: "reload",
        mode: "same-origin",
        signal: controller.signal,
      });
    }

    // Các điều kiện khác có thể có
    if (dt < Date.now() - 300_000)
      // Nếu nó cũ hơn 5 phút
      fetch("some.json", { cache: "no-cache", mode: "same-origin" }); // không hủy và không có giá trị trả về.
    return res;
  })
  .then((response) => {
    /* xử lý response (có thể đã cũ) */
  })
  .catch((error) => {
    /* Có thể là AbortError/DOMException hoặc TypeError */
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP](/en-US/docs/Web/HTTP)
