---
title: Battery Status API
slug: Web/API/Battery_Status_API
page-type: web-api-overview
browser-compat:
  - api.BatteryManager
  - api.Navigator.getBattery
spec-urls: https://w3c.github.io/battery/
---

{{DefaultAPISidebar("Battery API")}}{{securecontext_header}}

**Battery Status API**, thường được gọi là **Battery API**, cung cấp thông tin về mức sạc pin của hệ thống và cho phép bạn nhận thông báo qua các sự kiện được gửi khi mức pin hoặc trạng thái sạc thay đổi. Bạn có thể dùng API này để điều chỉnh mức sử dụng tài nguyên của ứng dụng nhằm giảm tiêu hao pin khi pin yếu, hoặc lưu các thay đổi trước khi pin cạn để tránh mất dữ liệu.

> [!NOTE]
> API này _không khả dụng_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được phơi bày qua {{domxref("WorkerNavigator")}}).

## Giao diện

- {{domxref("BatteryManager")}}
  - : Cung cấp thông tin về mức sạc pin của hệ thống.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.getBattery()")}}
  - : Trả về một {{JSxRef("Promise")}} được giải quyết với một đối tượng {{DOMxRef("BatteryManager")}}.

## Ví dụ

Trong ví dụ này, chúng ta theo dõi các thay đổi cả về trạng thái sạc (thiết bị có đang cắm điện và sạc hay không) lẫn mức pin và thời gian. Việc này được thực hiện bằng cách lắng nghe các sự kiện {{domxref("BatteryManager.chargingchange_event", "chargingchange")}}, {{domxref("BatteryManager.levelchange_event", "levelchange")}}, {{domxref("BatteryManager.chargingtimechange_event", "chargingtimechange")}} và {{domxref("BatteryManager.dischargingtimechange_event", "dischargingtimechange")}}.

```js
navigator.getBattery().then((battery) => {
  function updateAllBatteryInfo() {
    updateChargeInfo();
    updateLevelInfo();
    updateChargingInfo();
    updateDischargingInfo();
  }
  updateAllBatteryInfo();

  battery.addEventListener("chargingchange", () => {
    updateChargeInfo();
  });
  function updateChargeInfo() {
    console.log(`Battery charging? ${battery.charging ? "Yes" : "No"}`);
  }

  battery.addEventListener("levelchange", () => {
    updateLevelInfo();
  });
  function updateLevelInfo() {
    console.log(`Battery level: ${battery.level * 100}%`);
  }

  battery.addEventListener("chargingtimechange", () => {
    updateChargingInfo();
  });
  function updateChargingInfo() {
    console.log(`Battery charging time: ${battery.chargingTime} seconds`);
  }

  battery.addEventListener("dischargingtimechange", () => {
    updateDischargingInfo();
  });
  function updateDischargingInfo() {
    console.log(`Battery discharging time: ${battery.dischargingTime} seconds`);
  }
});
```

Xem thêm [ví dụ trong đặc tả](https://w3c.github.io/battery/#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết trên blog Hacks - Using the Battery API](https://hacks.mozilla.org/2012/02/using-the-battery-api-part-of-webapi/)
