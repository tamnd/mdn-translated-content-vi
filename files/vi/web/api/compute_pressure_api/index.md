---
title: Compute Pressure API
slug: Web/API/Compute_Pressure_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.PressureObserver
---

{{DefaultAPISidebar("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

**Compute Pressure API** là một JavaScript API cho phép bạn quan sát áp lực lên các tài nguyên hệ thống như CPU.

## Trường hợp sử dụng

Trong các ứng dụng thời gian thực, chẳng hạn như ứng dụng web hội nghị truyền hình, Compute Pressure API cho phép bạn phát hiện hệ thống hiện đang chịu loại áp lực nào. Hệ thống sẽ tự xử lý tình trạng quá tải hết mức có thể, nhưng sự phối hợp giữa hệ thống và ứng dụng sẽ giúp xử lý áp lực hiệu quả hơn. API này thông báo cho bạn khi trạng thái áp lực cấp cao thay đổi, để bạn có thể điều chỉnh khối lượng công việc mà vẫn mang lại trải nghiệm người dùng dễ chịu. Tín hiệu được gửi một cách chủ động khi xu hướng áp lực hệ thống tăng lên hoặc giảm bớt để cho phép thích ứng kịp thời.

Ví dụ, bạn có thể dùng các tín hiệu thay đổi áp lực này để giảm hoặc tăng chất lượng video hoặc số lượng luồng video hiển thị đồng thời nhằm tránh rớt khung hình, đứt âm thanh hoặc làm chậm các phần quan trọng khác của ứng dụng. Chất lượng dịch vụ của ứng dụng web cũng có thể thay đổi do áp lực từ các yếu tố bên ngoài và các ứng dụng khác vào những thời điểm bất ngờ, nhưng lý tưởng nhất là điều đó không dẫn đến lỗi toàn bộ hệ thống, độ trễ đầu vào hoặc tình trạng không phản hồi. Thay vào đó, tập tính năng được bật và mức chất lượng của chúng được cân bằng với áp lực tài nguyên của thiết bị người dùng cuối. Điều này tương tự áp lực mạng, khi một ứng dụng phát trực tuyến thích ứng với băng thông sẵn có.

Các trường hợp sử dụng khác gồm có:

- Trò chơi web, nơi bạn có thể cân bằng chất lượng và số lượng tài sản 3D, thay đổi tốc độ khung hình, độ phân giải, độ sâu trường ảnh, v.v. để đảm bảo độ trễ thấp và tốc độ khung hình ổn định.
- Giao diện người dùng, nơi bạn có thể hiển thị phần giữ chỗ thay vì dữ liệu thật khi hệ thống đang chịu áp lực và hiển thị nội dung thật khi áp lực đã giảm.

## Khái niệm và cách dùng

Các ứng dụng web nhanh và mượt nên cân bằng khối lượng công việc khi tài nguyên tính toán của hệ thống đang được sử dụng ở mức gần như tối đa. Mục tiêu của Compute Pressure API là ngăn ngừa, thay vì chỉ giảm nhẹ, trải nghiệm người dùng kém trong chính ứng dụng web cũng như tránh để thiết bị của người dùng trở nên quá nóng, quá ồn hoặc hao pin ở mức không thể chấp nhận. Vì vậy, bạn nên ưu tiên API này hơn các cơ chế phản hồi hoặc các điều chỉnh hiệu năng đơn lẻ (ví dụ bằng cách giảm tần suất của {{domxref("window.requestAnimationFrame")}}), vốn chỉ có thể giảm bớt trải nghiệm xấu chứ không tránh được nó một cách chủ động. Để đo lường và phân đoạn hiệu năng của các phiên người dùng sau khi sự việc đã xảy ra, API {{domxref("PerformanceLongTaskTiming")}} phù hợp hơn để phân tích các tác vụ chiếm luồng giao diện người dùng từ 50 mili giây trở lên (xem thêm [Performance API](/en-US/docs/Web/API/Performance_API) để biết các API đo lường hiệu năng khác).

### Các loại nguồn áp lực

Trong ứng dụng web hoặc trang web của bạn, các tác vụ khác nhau cạnh tranh thời gian xử lý của các đơn vị xử lý khác nhau (CPU, GPU và các đơn vị xử lý chuyên dụng khác). Phiên bản hiện tại của đặc tả Compute Pressure API định nghĩa hai loại nguồn chính có thể được truy vấn để thu thập thông tin áp lực:

- `"thermals"` biểu diễn trạng thái nhiệt tổng thể của toàn bộ hệ thống.
- `"cpu"` biểu diễn áp lực trung bình của bộ xử lý trung tâm (CPU) trên tất cả các lõi. Trạng thái này có thể bị ảnh hưởng bởi các ứng dụng và trang web khác ngoài chính trang đang quan sát.

Danh sách các nguồn được hỗ trợ thay đổi theo từng trình duyệt, hệ điều hành và phần cứng, và vẫn đang tiếp tục phát triển. Dùng gợi ý tĩnh {{domxref("PressureObserver.knownSources_static", "PressureObserver.knownSources")}} để xem loại nguồn nào khả dụng trên trình duyệt của bạn. Lưu ý rằng tính khả dụng cũng có thể thay đổi theo hệ điều hành và phần cứng. Hãy gọi {{domxref("PressureObserver.observe()", "observe()")}} và kiểm tra lỗi `NotSupportedError` để biết liệu có thể quan sát áp lực hay không.

Compute Pressure API khả dụng trong các ngữ cảnh sau:

- {{domxref("Window")}} (luồng chính)
- {{domxref("Worker")}}
- {{domxref("SharedWorker")}}
- {{HTMLElement("iframe")}} (nếu có [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/compute-pressure) phù hợp)

### Các trạng thái áp lực

Compute Pressure API phơi bày các trạng thái áp lực cấp cao, giúp trừu tượng hóa sự phức tạp của các nút thắt hệ thống mà không thể giải thích đầy đủ bằng các số đo cấp thấp như xung nhịp bộ xử lý và mức sử dụng. Thực tế, các số đo về mức sử dụng CPU thường [gây hiểu lầm](https://www.brendangregg.com/blog/2017-05-09/cpu-utilization-is-wrong.html). Vì vậy, Compute Pressure API sử dụng các trạng thái áp lực dễ đọc với các ngữ nghĩa sau (xem thêm [đặc tả](https://w3c.github.io/compute-pressure/#pressure-states)):

- ⚪ `"nominal"`: Điều kiện của thiết bị đích đang ở mức chấp nhận được, không có tác động bất lợi đáng chú ý đến người dùng.
- 🟢 `"fair"`: Áp lực, nhiệt độ và/hoặc mức sử dụng năng lượng của thiết bị đích tăng nhẹ, có thể làm giảm thời lượng pin và khiến quạt (hoặc các hệ thống có quạt) hoạt động và phát ra tiếng. Ngoài ra, thiết bị đích vẫn hoạt động ổn định và có thể nhận thêm công việc.
- 🟡 `"serious"`: Áp lực, nhiệt độ và/hoặc mức sử dụng năng lượng của thiết bị đích luôn ở mức cao. Hệ thống có thể đang hạ xung như một biện pháp đối phó để giảm nhiệt.
- 🔴 `"critical"`: Nhiệt độ của thiết bị đích hoặc hệ thống tăng đáng kể và cần được làm mát để tránh các vấn đề tiềm ẩn.

Các yếu tố đóng góp (tức là các số đo hệ thống nền bên dưới) cho các trạng thái áp lực ở trên không được đặc tả định nghĩa và có thể thay đổi tùy theo phần cứng nền tảng và hành vi của nền tảng. Tuy nhiên, đặc tả yêu cầu sự thay đổi trong các yếu tố đóng góp phải đủ lớn để tránh việc chuyển qua lại liên tục giữa các trạng thái. Điều này có nghĩa là bạn có thể kỳ vọng API không báo cáo các trạng thái khác nhau quá thường xuyên vì chúng không phản ứng với chỉ một số đo hệ thống dao động.

### Cân nhắc về bảo mật và quyền riêng tư

Compute Pressure API được [điều khiển bằng chính sách](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) bởi chỉ thị `"compute-pressure"`. Danh sách cho phép mặc định của nó là `'self'`, cho phép sử dụng trong các frame lồng nhau cùng origin nhưng ngăn nội dung bên thứ ba sử dụng tính năng này.

## Tài liệu tham khảo

### Giao diện

Các giao diện sau có mặt trong Compute Pressure API và bề mặt API tương tự các observer khác, chẳng hạn như {{domxref("IntersectionObserver")}}, {{domxref("MutationObserver")}} hoặc {{domxref("PerformanceObserver")}}.

- {{domxref("PressureObserver")}} {{experimental_inline}}
  - : Thông báo khi áp lực hệ thống thay đổi đối với một số nguồn được chỉ định (ví dụ CPU) tại khoảng thời gian lấy mẫu được xác định trước.
- {{domxref("PressureRecord")}}
  - : Mô tả xu hướng áp lực tại một thời điểm chuyển tiếp cụ thể.

### Chỉ thị Permissions-Policy

- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader('Permissions-Policy/compute-pressure','compute-pressure')}}
  - : Kiểm soát quyền truy cập vào Compute Pressure API.

## Ví dụ

### Ghi nhật ký áp lực hiện tại

Ví dụ này tạo một {{domxref("PressureObserver")}} và thực hiện hành động bất cứ khi nào áp lực thay đổi. Khoảng lấy mẫu được đặt là 1000ms, nghĩa là sẽ có cập nhật nhiều nhất mỗi giây một lần.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure ${lastRecord.state}`);
  if (lastRecord.state === "critical") {
    // disable video feeds
  } else if (lastRecord.state === "serious") {
    // disable video filter effects
  } else {
    // enable all video feeds and filter effects
  }
}

try {
  const observer = new PressureObserver(callback);
  await observer.observe("cpu", {
    sampleInterval: 1000, // 1000ms
  });
} catch (error) {
  // report error setting up the observer
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bản demo Compute Pressure](https://w3c.github.io/compute-pressure/demo/), dùng tập Mandelbrot và worker để tạo áp lực nhân tạo cho mục đích thử nghiệm.
