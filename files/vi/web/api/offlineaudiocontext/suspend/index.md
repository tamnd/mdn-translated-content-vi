---
title: "OfflineAudioContext: phương thức suspend()"
short-title: suspend()
slug: Web/API/OfflineAudioContext/suspend
page-type: web-api-instance-method
browser-compat: api.OfflineAudioContext.suspend
---

{{ APIRef("Web Audio API") }}

Phương thức **`suspend()`** của giao diện {{domxref("OfflineAudioContext")}} lên lịch tạm dừng tiến trình thời gian trong audio context vào thời điểm được chỉ định và trả về một promise. Điều này thường hữu ích khi thao tác đồ thị âm thanh một cách đồng bộ trên OfflineAudioContext.

Lưu ý rằng độ chính xác tối đa của việc tạm dừng là kích thước của render quantum và thời gian tạm dừng được chỉ định sẽ được làm tròn xuống ranh giới render quantum gần nhất. Vì lý do này, không được phép lên lịch nhiều lần tạm dừng tại cùng một frame được lượng hóa. Ngoài ra, việc lên lịch nên được thực hiện khi context không đang chạy để đảm bảo tạm dừng chính xác.

## Cú pháp

```js-nolint
suspend(suspendTime)
```

### Tham số

- `suspendTime`
  - : Một số thực chỉ định thời gian tạm dừng, tính bằng giây.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành {{jsxref('undefined')}}.

### Ngoại lệ

Promise bị từ chối khi gặp bất kỳ ngoại lệ nào.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu số frame được lượng hóa là một trong các trường hợp sau:
    - một số âm
    - nhỏ hơn hoặc bằng thời gian hiện tại
    - lớn hơn hoặc bằng tổng thời lượng render
    - được lên lịch bởi một lần tạm dừng khác cho cùng thời gian

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
