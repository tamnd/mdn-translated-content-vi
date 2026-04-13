---
title: "PressureRecord: state property"
short-title: state
slug: Web/API/PressureRecord/state
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PressureRecord.state
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`state`** là một chuỗi cho biết trạng thái áp lực được ghi lại.

## Giá trị

Một chuỗi cho biết trạng thái áp lực được ghi lại. Compute Pressure API sử dụng các trạng thái áp lực dễ đọc với ngữ nghĩa sau (xem thêm trong [đặc tả](https://w3c.github.io/compute-pressure/#pressure-states)):

- ⚪ `"nominal"`: Điều kiện của thiết bị đích ở mức chấp nhận được mà không có tác động bất lợi đáng chú ý nào đối với người dùng.
- 🟢 `"fair"`: Áp lực, nhiệt độ và/hoặc mức sử dụng năng lượng của thiết bị đích hơi cao, có thể dẫn đến giảm tuổi thọ pin, cũng như quạt (hoặc hệ thống có quạt) trở nên hoạt động và có tiếng ồn. Ngoài ra, thiết bị đích đang hoạt động tốt và có thể nhận thêm công việc.
- 🟡 `"serious"`: Áp lực, nhiệt độ và/hoặc mức sử dụng năng lượng của thiết bị đích liên tục cao. Hệ thống có thể đang điều chỉnh như một biện pháp đối phó để giảm nhiệt.
- 🔴 `"critical"`: Nhiệt độ của thiết bị đích hoặc hệ thống tăng đáng kể và cần làm mát để tránh bất kỳ sự cố tiềm ẩn nào.

## Ví dụ

### Sử dụng thuộc tính `state`

Trong ví dụ sau, chúng ta ghi lại giá trị của thuộc tính `state` trong callback của pressure observer.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure is ${lastRecord.state}`);
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
