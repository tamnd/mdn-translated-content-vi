---
title: Cấu trúc và định dạng profile
slug: Web/API/JS_Self-Profiling_API/Profile_content_and_format
page-type: guide
---

{{DefaultAPISidebar("JS Self-Profiling API")}}

Trong trang này, chúng ta sẽ mô tả cách diễn giải một profile được ghi lại bằng Self-Profiling API.

Định dạng của đối tượng được trả về bởi {{domxref("Profiler.stop()")}} được thiết kế để tiết kiệm không gian: ví dụ, định dạng nhằm tránh sao chép các giá trị URL cho các hàm được định nghĩa trong cùng một script. Điều này có nghĩa là cần một số diễn giải để hiểu cách một mẫu trong đối tượng profile ánh xạ đến một vị trí trong chương trình, và trang hướng dẫn này nhằm giải thích cách thực hiện diễn giải này.

Trong phần đầu tiên, chúng ta sẽ mô tả [cấu trúc trừu tượng của một profile](#cấu_trúc_của_một_profile). Trong phần tiếp theo, chúng ta sẽ mô tả [định dạng của đối tượng profile](#định_dạng_profile) được trả về bởi {{domxref("Profiler.stop()")}}. Cuối cùng, chúng ta sẽ [đi qua một ví dụ](#ví_dụ) để cho thấy profile của một chương trình nhất định trông như thế nào và cách nó có thể được diễn giải.

## Cấu trúc của một profile

Trong phần này, chúng ta sẽ mô tả cấu trúc trừu tượng của một profile. Lưu ý rằng đây không phải là định dạng của đối tượng được trả về bởi {{domxref("Profiler.stop()")}}: chúng ta sẽ mô tả định dạng đó trong phần tiếp theo của hướng dẫn này.

Một profile bao gồm một mảng các mẫu. Mỗi mẫu bao gồm một timestamp và một call stack. Mỗi call stack bao gồm một mảng các stack frame, và mỗi stack frame chứa thông tin về vị trí của hàm tương ứng trong chương trình:

![Sơ đồ của một profile](profile.svg)

Timestamp là một {{domxref("DOMHighResTimeStamp")}} đo mili giây kể từ _time origin_: đối với ngữ cảnh window, đây là thời điểm window được tạo (nếu window mới) hoặc thời điểm trình duyệt bắt đầu điều hướng đến tài liệu này.

Call stack là một biểu diễn của JavaScript call stack, cho phép bạn hiểu đường dẫn thực thi đến vị trí của chương trình tại thời điểm mẫu được lấy.

Call stack bao gồm một mảng các stack frame. Một stack frame về cơ bản đại diện cho một lời gọi hàm lồng nhau, vì vậy nếu hàm `a()` gọi hàm `b()`, gọi hàm `c()`, và một mẫu được lấy trong khi trình duyệt đang thực thi `c()`, thì call stack sẽ bao gồm các frame `[a, b, c]`:

```js
function c() {
  // mẫu được lấy ở đây
}

function b() {
  c();
}

function a() {
  b();
}
```

Mỗi stack frame chứa thông tin về vị trí của hàm tương ứng trong chương trình:

- URL của script
- Tên của hàm
- Số dòng của định nghĩa hàm trong script
- Số cột của định nghĩa hàm trong dòng

## Định dạng profile

Mặc dù phần trên mô tả cấu trúc _logic_ của một profile, định dạng của đối tượng được trả về bởi {{domxref("Profiler.stop()")}} là khác. Lý do là định dạng được thiết kế để tiết kiệm không gian: ví dụ, định dạng nhằm tránh sao chép các giá trị URL cho các hàm được định nghĩa trong cùng một script.

Đối tượng profile chứa bốn thuộc tính, tất cả đều là mảng:

- `frames`
  - : Một mảng các đối tượng, mỗi đối tượng chứa thông tin về một stack frame:
    - `column`: số cột của định nghĩa hàm.
    - `line`: số dòng của định nghĩa hàm.
    - `name`: tên của hàm.
    - `resourceId`: chỉ mục của một mục trong `resources`, đại diện cho URL của script mà hàm được định nghĩa.

    Chỉ có `name` luôn có mặt: nếu hàm không được định nghĩa trong một script (ví dụ, nếu đó là hàm được tích hợp sẵn trong trình duyệt) thì ba thuộc tính kia bị bỏ qua.

- `resources`
  - : Một mảng các chuỗi, mỗi chuỗi đại diện cho URL của một script.
- `samples`
  - : Một mảng các đối tượng, mỗi đối tượng chứa hai thuộc tính:
    - `timestamp`: thời điểm mẫu được lấy.
    - `stackId`: chỉ mục của một phần tử trong mảng `stacks`.
- `stacks`
  - : Một mảng các đối tượng, mỗi đối tượng chứa hai thuộc tính:
    - `frameId`: chỉ mục của một phần tử trong `frames` đại diện cho frame lồng nhau sâu nhất trong stack.
    - `parentId`: chỉ mục của một mục khác trong `stacks`, đại diện cho call stack trừ frame được đại diện bởi `frameId`. Không có nếu frame được đại diện bởi `frameId` ở cấp độ đầu tiên của stack.

## Ví dụ

Trong ví dụ sau, chúng ta có một trang web chứa một nút: khi người dùng nhấn nút, trang tạo ra một số số nguyên tố.

HTML chỉ chứa nút:

```html
<button id="generate">generate!</button>
```

JavaScript được chia thành hai tệp. Script "main.js" chứa trình xử lý click cho nút. Nó bắt đầu một profile, sau đó gọi code để tạo các số nguyên tố, sau đó ghi lại profile kết quả:

```js
// main.js

import { genPrimes } from "./generate.js";

async function handleClick() {
  const profiler = new Profiler({ sampleInterval: 10, maxBufferSize: 10000 });

  const primes = genPrimes();
  console.log(`Finished generating ${primes.length} primes!`);

  const trace = await profiler.stop();
  console.log(JSON.stringify(trace));
}

document.querySelector("#generate").addEventListener("click", handleClick);
```

Script "generate.js" tạo các số nguyên tố, được tổ chức thành hai hàm, `genPrimes()` và `isPrime()`:

```js
// generate.js

const MAX_PRIME = 1000000000;
const PRIMES_QUOTA = 10000;

function isPrime(n) {
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return n > 1;
}

export function genPrimes() {
  const primes = [];
  while (primes.length < PRIMES_QUOTA) {
    const candidate = Math.floor(Math.random() * MAX_PRIME);
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }
  return primes;
}
```

Nếu chúng ta chạy code này, một profile như bên dưới sẽ được ghi vào bảng điều khiển công cụ nhà phát triển:

```json
{
  "frames": [
    { "name": "Profiler" },
    { "column": 27, "line": 5, "name": "handleClick", "resourceId": 0 },
    { "column": 17, "line": 6, "name": "isPrime", "resourceId": 1 },
    { "column": 26, "line": 15, "name": "genPrimes", "resourceId": 1 }
  ],
  "resources": [
    "http://localhost:3000/main.js",
    "http://localhost:3000/generate.js"
  ],
  "samples": [
    { "stackId": 1, "timestamp": 2972.734999999404 },
    { "stackId": 3, "timestamp": 2973.4899999946356 },
    { "stackId": 3, "timestamp": 2974.5700000077486 },
    { "stackId": 3, "timestamp": 2977.8649999946356 },
    { "stackId": 3, "timestamp": 2978.4899999946356 },
    { "stackId": 3, "timestamp": 2978.6950000077486 },
    { "stackId": 3, "timestamp": 2978.9500000029802 },
    { "stackId": 3, "timestamp": 2979.405000001192 },
    { "stackId": 2, "timestamp": 2980.030000001192 },
    { "stackId": 2, "timestamp": 2980.655000001192 }
  ],
  "stacks": [
    { "frameId": 1 },
    { "frameId": 0, "parentId": 0 },
    { "frameId": 3, "parentId": 0 },
    { "frameId": 2, "parentId": 2 }
  ]
}
```

Profile này đã ghi lại 10 mẫu, được liệt kê trong thuộc tính `samples`.

Thuộc tính `stackId` của mỗi mẫu cho phép chúng ta hiểu chương trình đang ở đâu tại thời điểm mẫu được lấy, và trong trường hợp này chúng ta đã lấy mẫu ở ba vị trí khác nhau:

- `stackId: 1`: một mẫu
- `stackId: 3`: bảy mẫu
- `stackId: 2`: hai mẫu

Để tìm call stack đầy đủ cho một mẫu, chúng ta lấy stack cho `stackId`, sau đó sử dụng giá trị `frameId` trong stack để tìm hàm lồng nhau sâu nhất, sau đó lấy đệ quy các stack cha bằng cách dùng `parentId`, cho đến khi chúng ta đạt cấp độ đầu tiên, không có giá trị `parentId`.

Ví dụ, sơ đồ bên dưới cho thấy cách chúng ta có thể suy ra call stack đầy đủ cho bảy mẫu có `stackId` là 3:

![Suy ra call stack từ một mẫu](profile-format.svg)

Lưu ý rằng mục đầu tiên trong `frames`, có giá trị `name` là `Profiler`, đại diện cho một mẫu được lấy trong hàm khởi tạo {{domxref("Profiler.Profiler", "Profiler()")}}: vì đây là hàm được cung cấp bởi trình duyệt, frame không bao gồm thông tin script.
