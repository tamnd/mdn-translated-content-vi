---
title: "PerformanceEntry: name property"
short-title: name
slug: Web/API/PerformanceEntry/name
page-type: web-api-instance-property
browser-compat: api.PerformanceEntry.name
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("PerformanceEntry")}} là một chuỗi biểu thị tên của performance entry. Nó đóng vai trò như một định danh, nhưng không nhất thiết phải duy nhất. Giá trị phụ thuộc vào lớp con.

## Giá trị

Một chuỗi. Giá trị phụ thuộc vào lớp con của đối tượng `PerformanceEntry` như bảng bên dưới.

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Lớp con</th>
      <th scope="col">Giá trị</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref('LargestContentfulPaint')}}</td>
      <td>Luôn trả về một chuỗi rỗng.</td>
    </tr>
    <tr>
      <td>{{domxref('LayoutShift')}}</td>
      <td>Luôn trả về <code>"layout-shift"</code>.</td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceElementTiming')}}</td>
      <td>Một trong các chuỗi sau:
        <ul>
          <li><code>"image-paint"</code></li>
          <li><code>"text-paint"</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceEventTiming')}}</td>
      <td>Loại của sự kiện liên kết.</td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceLongTaskTiming')}}</td>
      <td>Một trong các chuỗi sau:
        <ul>
          <li><code>"cross-origin-ancestor"</code></li>
          <li><code>"cross-origin-descendant"</code></li>
          <li><code>"cross-origin-unreachable"</code></li>
          <li><code>"multiple-contexts"</code></li>
          <li><code>"same-origin-ancestor"</code></li>
          <li><code>"same-origin-descendant"</code></li>
          <li><code>"same-origin"</code></li>
          <li><code>"self"</code></li>
          <li><code>"unknown"</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceMark')}}</td>
      <td>
        Tên được dùng khi mark được tạo bằng cách gọi
        {{domxref("Performance.mark","performance.mark()")}}.
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceMeasure')}}</td>
      <td>
        Tên được dùng khi measure được tạo bằng cách gọi
        {{domxref("Performance.measure","performance.measure()")}}.
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceNavigationTiming')}}</td>
      <td>URL đã được phân giải của tài nguyên được yêu cầu.
      Lưu ý rằng điều này không bao gồm bất kỳ <a href="/en-US/docs/Web/URI/Reference/Fragment/Text_fragments">text fragment</a> hay chỉ thị fragment nào khác.
      Giá trị này không đổi ngay cả khi yêu cầu bị chuyển hướng.
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformancePaintTiming')}}</td>
      <td>Một trong các chuỗi sau:
        <ul>
          <li><code>"first-paint"</code></li>
          <li><code>"first-contentful-paint"</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>{{domxref('PerformanceResourceTiming')}}</td>
      <td>URL đã được phân giải của tài nguyên được yêu cầu. Giá trị này không đổi ngay cả khi yêu cầu bị chuyển hướng.</td>
    </tr>
    <tr>
      <td>{{domxref('TaskAttributionTiming')}}</td>
      <td>Luôn trả về <code>"unknown"</code>.</td>
    </tr>
    <tr>
      <td>{{domxref('VisibilityStateEntry')}}</td>
      <td>Một trong các chuỗi sau:
        <ul>
          <li><code>"visible"</code></li>
          <li><code>"hidden"</code></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Lọc performance entry theo tên

Khi `PerformanceEntry` là một đối tượng {{domxref('PerformanceResourceTiming')}}, thuộc tính `name` tham chiếu đến URL đã được phân giải của tài nguyên được yêu cầu.
Trong trường hợp này, thuộc tính `name` có thể hữu ích để lọc các tài nguyên cụ thể, ví dụ như tất cả ảnh SVG.

```js
// Ghi lại thời lượng của các tài nguyên SVG
performance.getEntriesByType("resource").forEach((entry) => {
  if (entry.name.endsWith(".svg")) {
    console.log(`${entry.name}'s duration: ${entry.duration}`);
  }
});
```

### Lấy performance entry theo tên

Cả {{domxref("Performance")}} và {{domxref("PerformanceObserver")}} đều cung cấp các phương thức cho phép bạn lấy performance entry theo tên trực tiếp. Bạn không nhất thiết phải dùng thuộc tính `name` cho việc đó, thay vào đó có thể dùng {{domxref("Performance.getEntriesByName()")}} hoặc {{domxref("PerformanceObserverEntryList.getEntriesByName()")}}.

```js
// Ghi lại tất cả mark có tên "debug-marks" tại thời điểm này
const debugMarks = performance.getEntriesByName("debug-mark", "mark");
debugMarks.forEach((entry) => {
  console.log(`${entry.name}'s startTime: ${entry.startTime}`);
});

// Phiên bản PerformanceObserver
// Ghi lại tất cả mark có tên "debug-marks" khi chúng xuất hiện
function perfObserver(list, observer) {
  list.getEntriesByName("debug-mark", "mark").forEach((entry) => {
    console.log(`${entry.name}'s startTime: ${entry.startTime}`);
  });
}
const observer = new PerformanceObserver(perfObserver);
observer.observe({ entryTypes: ["measure", "mark"] });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.getEntriesByName()")}}
- {{domxref("PerformanceObserverEntryList.getEntriesByName()")}}
