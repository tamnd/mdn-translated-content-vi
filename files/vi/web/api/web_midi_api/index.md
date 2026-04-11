---
title: Web MIDI API
slug: Web/API/Web_MIDI_API
page-type: web-api-overview
browser-compat:
  - api.Navigator.requestMIDIAccess
  - http.headers.Permissions-Policy.midi
  - api.Permissions.permission_midi
spec-urls: https://webaudio.github.io/web-midi-api/
---

{{DefaultAPISidebar("Web MIDI API")}}{{SecureContext_Header}}

Web MIDI API kết nối và tương tác với các thiết bị Musical Instrument Digital Interface (MIDI).

Các giao diện này xử lý những khía cạnh thực tế của việc gửi và nhận thông điệp MIDI.
Vì vậy, API này có thể được dùng cho cả mục đích âm nhạc lẫn phi âm nhạc, với bất kỳ thiết bị MIDI nào được kết nối với máy tính của bạn.

## Giao diện

- {{domxref("MIDIInputMap")}}
  - : Đại diện cho tất cả các cổng đầu vào MIDI hiện có.
- {{domxref("MIDIOutputMap")}}
  - : Đại diện cho tất cả các cổng đầu ra MIDI hiện có.
- {{domxref("MIDIAccess")}}
  - : Cung cấp các phương thức để liệt kê thiết bị đầu vào và đầu ra, đồng thời truy cập từng thiết bị riêng lẻ.
- {{domxref("MIDIPort")}}
  - : Đại diện cho một cổng MIDI riêng lẻ.
- {{domxref("MIDIInput")}}
  - : Cung cấp một phương thức để xử lý các thông điệp MIDI từ một cổng đầu vào.
- {{domxref("MIDIOutput")}}
  - : Xếp hàng các thông điệp để gửi tới cổng MIDI được liên kết. Thông điệp có thể được gửi ngay lập tức hoặc sau một độ trễ xác định.
- {{domxref("MIDIMessageEvent")}}
  - : Sự kiện được truyền tới sự kiện {{domxref("MIDIInput.midimessage_event", "midimessage")}} của `MIDIInput`.
- {{domxref("MIDIConnectionEvent")}}
  - : Sự kiện được truyền tới các sự kiện {{domxref("MIDIAccess.statechange_event", "statechange")}} của `MIDIAccess` và {{domxref("MIDIPort.statechange_event", "statechange")}} của `MIDIPort`, khi một cổng trở nên khả dụng hoặc không khả dụng.

## Yêu cầu bảo mật

Quyền truy cập API được yêu cầu bằng phương thức {{domxref("navigator.requestMIDIAccess()")}}.

- Phương thức này phải được gọi trong [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Quyền truy cập có thể bị chặn bởi HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) [`midi`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/midi).
- Người dùng phải cấp quyền rõ ràng để sử dụng API thông qua cơ chế cụ thể của user agent, hoặc đã từng cấp quyền trước đó.
  Lưu ý rằng nếu quyền truy cập bị từ chối bởi policy quyền, thì quyền của người dùng cũng không thể cấp lại được.

Trạng thái quyền có thể được truy vấn bằng phương thức của [Permissions API](/en-US/docs/Web/API/Permissions_API) [`navigator.permissions.query()`](/en-US/docs/Web/API/Permissions/query), bằng cách truyền vào một permission descriptor với quyền `midi` và thuộc tính `sysex` (tùy chọn):

```js
navigator.permissions.query({ name: "midi", sysex: true }).then((result) => {
  if (result.state === "granted") {
    // Truy cập được cấp.
  } else if (result.state === "prompt") {
    // Việc sử dụng API sẽ yêu cầu cấp quyền
  }
  // Quyền bị từ chối bởi lời nhắc của người dùng hoặc bởi permission policy
});
```

## Ví dụ

### Lấy quyền truy cập vào cổng MIDI

Phương thức {{domxref("navigator.requestMIDIAccess()")}} trả về một promise mà khi resolve sẽ cho ra một đối tượng {{domxref("MIDIAccess")}}, từ đó có thể dùng để truy cập một thiết bị MIDI.
Phương thức này phải được gọi trong một secure context.

```js
let midi = null; // đối tượng MIDIAccess toàn cục
function onMIDISuccess(midiAccess) {
  console.log("MIDI đã sẵn sàng!");
  midi = midiAccess; // lưu vào biến toàn cục (trong thực tế có thể sẽ giữ trong một instance đối tượng)
}

function onMIDIFailure(msg) {
  console.error(`Không thể lấy quyền truy cập MIDI - ${msg}`);
}

navigator.requestMIDIAccess().then(onMIDISuccess, onMIDIFailure);
```

### Liệt kê đầu vào và đầu ra

Trong ví dụ này, danh sách các cổng đầu vào và đầu ra được lấy ra và in ra console.

```js
function listInputsAndOutputs(midiAccess) {
  for (const entry of midiAccess.inputs) {
    const input = entry[1];
    console.log(
      `Cổng đầu vào [type:'${input.type}']` +
        ` id:'${input.id}'` +
        ` manufacturer:'${input.manufacturer}'` +
        ` name:'${input.name}'` +
        ` version:'${input.version}'`,
    );
  }

  for (const entry of midiAccess.outputs) {
    const output = entry[1];
    console.log(
      `Cổng đầu ra [type:'${output.type}'] id:'${output.id}' manufacturer:'${output.manufacturer}' name:'${output.name}' version:'${output.version}'`,
    );
  }
}
```

### Xử lý đầu vào MIDI

Ví dụ này in tất cả thông điệp đầu vào MIDI ra console.

```js
function onMIDIMessage(event) {
  let str = `Đã nhận thông điệp MIDI tại timestamp ${event.timeStamp}[${event.data.length} bytes]: `;
  for (const character of event.data) {
    str += `0x${character.toString(16)} `;
  }
  console.log(str);
}

function startLoggingMIDIInput(midiAccess) {
  midiAccess.inputs.forEach((entry) => {
    entry.onmidimessage = onMIDIMessage;
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introduction to Web MIDI](https://code.tutsplus.com/introduction-to-web-midi--cms-25220t)
- [Making Music in the Browser](https://www.keithmcmillen.com/blog/making-music-in-the-browser-web-midi-api/)
