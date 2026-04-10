---
title: "ReadableStream: phương thức cancel()"
short-title: cancel()
slug: Web/API/ReadableStream/cancel
page-type: web-api-instance-method
browser-compat: api.ReadableStream.cancel
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`cancel()`** của giao diện {{domxref("ReadableStream")}} trả về {{jsxref("Promise")}} sẽ giải quyết khi luồng bị hủy.

Hủy được sử dụng khi bạn đã hoàn thành xong luồng và không cần thêm bất kỳ dữ liệu nào từ luồng đó, ngay cả khi có nhiều đoạn được xếp hàng đợi để đọc.
Dữ liệu đó bị mất sau khi hủy được gọi và luồng không thể đọc được nữa.
Để đọc những đoạn đó mà không bị loại bỏ hoàn toàn luồng, bạn hãy sử dụng {{domxref("ReadableStreamDefaultController.close()")}}.

## Cú pháp

```js-nolint
cancel()
cancel(reason)
```

### Parameters

- `reason` {{optional_inline}}
  - : A human-readable reason for the cancellation.
    This is passed to the underlying source, which may or may not use it.

### Return value

A {{jsxref("Promise")}}, which fulfills with `undefined` value.

### Exceptions

- {{jsxref("TypeError")}}
  - : The stream you are trying to cancel is not a {{domxref("ReadableStream")}}, or it is locked.

## Examples

In the following example, a stream is used to fetch the WHATWG HTML spec chunk by chunk; each chunk is searched for the string "service workers". When the search terms is found, `cancel()` is used to cancel the stream — the job is finished so it is no longer needed.

```html
<pre id="output"></pre>
```

```js hidden
const output = document.getElementById("output");

function log(text) {
  output.textContent += `${text}\n`;
}
```

```js
const searchTerm = "service workers";
// Chars to show either side of the result in the match
const contextBefore = 30;
const contextAfter = 30;
const caseInsensitive = true;
const url = "https://html.spec.whatwg.org/";

log(`Đang tìm kiếm '${url}' '${searchTerm}'`);

fetch(url)
  .then((response) => {
    log("Received headers");

    const decoder = new TextDecoder();
    const reader = response.body.getReader();
    const toMatch = caseInsensitive ? searchTerm.toLowerCase() : searchTerm;
    const bufferSize = Math.max(toMatch.length - 1, contextBefore);

    let bytesReceived = 0;
    let buffer = "";
    let matchFoundAt = -1;

    return reader.read().then(function process(result) {
      if (result.done) {
        log("Failed to find match");
        return;
      }

      bytesReceived += result.value.length;
      log(`Đã nhận được ${bytesReceived} byte dữ liệu cho đến nay`);

      buffer += decoder.decode(result.value, { stream: true });

      // already found match & just context-gathering?
      if (matchFoundAt === -1) {
        matchFoundAt = (
          caseInsensitive ? buffer.toLowerCase() : buffer
        ).indexOf(toMatch);
      }

      if (matchFoundAt === -1) {
        buffer = buffer.slice(-bufferSize);
      } else if (
        buffer.slice(matchFoundAt + toMatch.length).length >= contextAfter
      ) {
        log("Here's the match:");
        log(
          buffer.slice(
            Math.max(0, matchFoundAt - contextBefore),
            matchFoundAt + toMatch.length + contextAfter,
          ),
        );
        log("Cancelling fetch");
        reader.cancel();
        return;
      } else {
        log("Found match, but need more context…");
      }

      // keep reading
      return reader.read().then(process);
    });
  })
  .catch((err) => {
    log(
      "Something went wrong. See devtools for details. Does the response lack CORS headers?",
    );
    throw err;
  });
```

{{EmbedLiveSample("examples", "", 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- hàm tạo {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}
- [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
