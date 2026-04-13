---
title: "PerformanceNavigation: type property"
short-title: type
slug: Web/API/PerformanceNavigation/type
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.PerformanceNavigation.type
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc **`PerformanceNavigation.type`** đã lỗi thời trả về một `unsigned short` chứa hằng số mô tả cách điều hướng đến trang này được thực hiện.

> [!WARNING]
> Giao diện của thuộc tính này đã lỗi thời trong [Thông số kỹ thuật Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

## Giá trị

Một `unsigned short`.

Các giá trị có thể là:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Giá trị</th>
      <th scope="col">Tên hằng số</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>0</code></td>
      <td><code>TYPE_NAVIGATE</code></td>
      <td>
        Trang được truy cập bằng cách nhấp vào liên kết, dấu trang, gửi biểu mẫu, script, hoặc nhập URL vào thanh địa chỉ.
      </td>
    </tr>
    <tr>
      <td><code>1</code></td>
      <td><code>TYPE_RELOAD</code></td>
      <td>
        Trang được truy cập bằng cách nhấp vào nút Tải lại hoặc thông qua phương thức {{domxref("Location.reload()")}}.
      </td>
    </tr>
    <tr>
      <td><code>2</code></td>
      <td><code>TYPE_BACK_FORWARD</code></td>
      <td>Trang được truy cập bằng cách điều hướng vào lịch sử.</td>
    </tr>
    <tr>
      <td><code>255</code></td>
      <td><code>TYPE_RESERVED</code></td>
      <td>Bất kỳ cách nào khác.</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Trước đây, các nhà phát triển đã kiểm tra `type` là `"TYPE_BACK_FORWARD"` để lấy tỷ lệ hit của back/forward cache ({{glossary("bfcache")}}). Tuy nhiên, điều này không cung cấp bất kỳ lý do nào cho việc chặn bfcache, hay bất kỳ dữ liệu nào khác. Thuộc tính {{domxref("PerformanceNavigationTiming.notRestoredReasons")}} nên được sử dụng để theo dõi bfcache. Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết thêm thông tin.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("PerformanceNavigation")}} mà thuộc tính này thuộc về.
