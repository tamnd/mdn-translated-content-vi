---
title: "KeyboardEvent: thuộc tính location"
short-title: location
slug: Web/API/KeyboardEvent/location
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.location
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.location`** trả về một
`số nguyên không dấu` biểu diễn vị trí của phím trên bàn phím hoặc thiết bị
nhập liệu khác.

Các giá trị có thể là:

<table class="standard-table">
  <thead>
    <tr>
      <th>Hằng số</th>
      <th>Giá trị</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>DOM_KEY_LOCATION_STANDARD</code></td>
      <td>0</td>
      <td>
        Phím chỉ có một phiên bản, hoặc không thể phân biệt giữa các phiên bản
        bên trái và bên phải của phím, và không được nhấn trên bàn phím số
        hoặc một phím được coi là một phần của bàn phím số.
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_LEFT</code></td>
      <td>1</td>
      <td>
        Phím là phiên bản bên trái của phím; ví dụ, phím
        <kbd>Control</kbd> bên trái được nhấn trên bàn phím Mỹ 101 phím tiêu chuẩn.
        Giá trị này chỉ được sử dụng cho các phím có nhiều hơn một vị trí
        có thể trên bàn phím.
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_RIGHT</code></td>
      <td>2</td>
      <td>
        Phím là phiên bản bên phải của phím; ví dụ, phím
        <kbd>Control</kbd> bên phải được nhấn trên bàn phím Mỹ 101 phím tiêu chuẩn.
        Giá trị này chỉ được sử dụng cho các phím có nhiều hơn một vị trí
        có thể trên bàn phím.
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_NUMPAD</code></td>
      <td>3</td>
      <td>
        <p>
          Phím nằm trên bàn phím số, hoặc có mã phím ảo
          tương ứng với bàn phím số.
        </p>
        <div class="note">
          <p>
            <strong>Lưu ý:</strong> Khi <kbd>NumLock</kbd> được khóa, Firefox
            luôn trả về <code>DOM_KEY_LOCATION_NUMPAD</code> cho các phím trên
            bàn phím số. Nếu không, khi <kbd>NumLock</kbd> được mở khóa và
            bàn phím thực sự có bàn phím số, Firefox luôn trả về
            <code>DOM_KEY_LOCATION_NUMPAD</code>. Mặt khác, nếu
            bàn phím không có bàn phím số, chẳng hạn như trên máy tính xách tay, một số
            phím chỉ trở thành Numpad khi NumLock được khóa. Khi các phím đó kích hoạt
            sự kiện phím, giá trị thuộc tính location phụ thuộc vào phím.
            Tức là, nó không được là <code>DOM_KEY_LOCATION_NUMPAD</code>.
          </p>
        </div>
        <div class="note">
          <p>
            <strong>Lưu ý:</strong> Các sự kiện phím của phím <kbd>NumLock</kbd> cho biết
            <code>DOM_KEY_LOCATION_STANDARD</code> trên cả Firefox và Internet
            Explorer.
          </p>
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <code>DOM_KEY_LOCATION_MOBILE</code>
        {{Non-standard_inline()}} {{deprecated_inline}}
      </td>
      <td>4</td>
      <td>
        <p>
          Phím nằm trên thiết bị di động; điều này có thể là trên
          bàn phím vật lý hoặc bàn phím ảo.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <code>DOM_KEY_LOCATION_JOYSTICK</code> {{Non-standard_inline()}}
        {{deprecated_inline}}
      </td>
      <td>5</td>
      <td>
        <p>
          Phím là một nút trên bộ điều khiển trò chơi hoặc cần điều khiển trên thiết bị di động.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Giá trị

Một số.

## Ví dụ

```js
function keyEvent(event) {
  console.log(`Vị trí của phím đã nhấn: ${event.location}`);
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyboardEvent")}}
