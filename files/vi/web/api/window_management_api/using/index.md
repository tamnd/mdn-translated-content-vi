---
title: Sử dụng Window Management API
slug: Web/API/Window_Management_API/Using
page-type: guide
---

{{DefaultAPISidebar("Window Management API")}}

Hướng dẫn này giải thích cách sử dụng [Window Management API](/en-US/docs/Web/API/Window_Management_API). Mã ví dụ bên dưới được lấy từ ví dụ [Môi trường học đa cửa sổ](https://mdn.github.io/dom-examples/window-management-api/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/window-management-api)).

## Phát hiện tính năng

Bạn có thể phát hiện Window Management API bằng cách kiểm tra sự tồn tại của `getScreenDetails` trong phiên bản `window` hiện tại. Ví dụ, bạn có thể muốn cung cấp nút để mở màn hình đa cửa sổ nếu API được hỗ trợ, hoặc trải nghiệm khác như tạo liên kết đến các trang khác nhau nếu không được hỗ trợ:

```js
if ("getScreenDetails" in window) {
  // The Window Management API is supported
  createButton();
} else {
  // The Window Management API is not supported
  createLinks(sites);
}
```

## Sử dụng cơ bản

Cốt lõi của Windows Management API là phương thức {{domxref("Window.getScreenDetails()")}}, trả về một đối tượng chứa thông tin chi tiết về tất cả màn hình có sẵn cho hệ thống của người dùng:

```js
const screenDetails = await window.getScreenDetails();

// Return the number of screens
const noOfScreens = screenDetails.screens.length;
```

Khi `getScreenDetails()` được gọi, người dùng sẽ được yêu cầu cấp quyền quản lý cửa sổ trên tất cả màn hình của họ (trạng thái quyền này có thể được kiểm tra bằng cách sử dụng {{domxref("Permissions.query()")}} để truy vấn `window-management`). Nếu người dùng cấp quyền, một đối tượng {{domxref("ScreenDetails")}} sẽ được trả về. Đối tượng này chứa các thuộc tính sau:

- `screens`: Mảng các đối tượng {{domxref("ScreenDetailed")}}, mỗi đối tượng chứa thông tin chi tiết về từng màn hình riêng biệt có sẵn cho hệ thống (xem bên dưới). Mảng này cũng hữu ích để xác định số lượng màn hình có sẵn thông qua `screens.length`.
- `currentScreen`: Một đối tượng {{domxref("ScreenDetailed")}} chứa thông tin chi tiết về màn hình đang hiển thị cửa sổ trình duyệt hiện tại.

Các đối tượng {{domxref("ScreenDetailed")}} kế thừa các thuộc tính của giao diện {{domxref("Screen")}} và chứa thông tin hữu ích để đặt cửa sổ trên các màn hình cụ thể.

> [!NOTE]
> Bạn có thể giới hạn chức năng dựa trên việc người dùng có nhiều hơn một màn hình hay không bằng cách sử dụng thuộc tính {{domxref("Screen.isExtended", "Window.screen.isExtended")}}. Thuộc tính này trả về `true` nếu thiết bị có nhiều màn hình, và `false` nếu không.

### Mở cửa sổ

Bạn vẫn cần sử dụng {{domxref("Window.open()")}} để mở và quản lý cửa sổ, nhưng thông tin trên cung cấp cho bạn dữ liệu tốt hơn để làm điều đó trong môi trường đa màn hình. Ví dụ, một hàm tiện ích có thể trông như sau:

```js
// Array to hold references to the currently open windows
const windowRefs = [];

// …

function openWindow(left, top, width, height, url) {
  const windowFeatures = `left=${left},top=${top},width=${width},height=${height}`;
  const windowRef = window.open(
    url,
    "_blank", // needed for it to open in a new window
    windowFeatures,
  );

  if (windowRef === null) {
    // If the browser is blocking new windows, close any windows that were
    // able to open and display instructions to help the user fix this problem
    closeAllWindows();
    popoverElem.showPopover();
  } else {
    // Store a reference to the window in the windowRefs array
    windowRefs.push(windowRef);
  }
}
```

Sau đó bạn sẽ gọi hàm này và mở cửa sổ trên các màn hình cụ thể như sau:

```js
const screen1 = screenDetails.screens[0];
const screen2 = screenDetails.screens[1];
// Windows will be a third the width and the full height of the screen
// The available width of screen1, minus 3 times the horizontal browser chrome
// width, divided by 3
const windowWidth = Math.floor((screen1.availWidth - 3 * WINDOW_CHROME_X) / 3);
// The available height of screen1, minus the vertical browser chrome width
const windowHeight = Math.floor(screen1.availHeight - WINDOW_CHROME_Y);

// Open a window a third of the width and the entire height of the primary screen
openWindow(
  screen1.availLeft,
  screen1.availTop,
  windowWidth,
  windowHeight,
  sites[1].url,
);

// …
```

### Đóng tất cả cửa sổ

Sau khi mở mỗi cửa sổ, chúng ta thêm một tham chiếu vào mảng `windowRefs`. Điều này cho phép bạn, ví dụ, đóng tất cả chúng khi một cửa sổ bị đóng:

```js
function closeAllWindows() {
  // Loop through all window refs and close each one
  windowRefs.forEach((windowRef) => {
    windowRef.close();
  });
  windowRefs = [];
}

// Check whether one of our popup windows has been closed
// If so, close them all

closeMonitor = setInterval(checkWindowClose, 250);

function checkWindowClose() {
  if (windowRefs.some((windowRef) => windowRef.closed)) {
    closeAllWindows();
    clearInterval(closeMonitor);
  }
}
```

> [!NOTE]
> Trong các thử nghiệm của chúng tôi, phương thức polling {{domxref("Window.setInterval", "setInterval()")}} hiển thị ở trên dường như hoạt động tốt nhất để phát hiện việc đóng cửa sổ trong trường hợp có nhiều cửa sổ. Việc sử dụng các sự kiện như {{domxref("Window/beforeunload_event", "beforeunload")}}, {{domxref("Window/pagehide_event", "pagehide")}}, hoặc {{domxref("Document/visibilitychange_event", "visibilitychange")}} tỏ ra không đáng tin cậy vì khi mở nhiều cửa sổ cùng lúc, sự thay đổi nhanh chóng về focus/visibility dường như kích hoạt hàm xử lý sớm hơn cần thiết.

> [!NOTE]
> Một vấn đề với ví dụ trên là nó sử dụng các giá trị hằng số để đại diện cho kích thước của các phần giao diện Chrome trong các tính toán, `WINDOW_CHROME_X` và `WINDOW_CHROME_Y`, để có được tính toán kích thước cửa sổ chính xác. Để tạo các cửa sổ có kích thước chính xác trên các triển khai API khác trong tương lai, bạn cần duy trì một thư viện nhỏ về kích thước chrome trình duyệt và sử dụng phát hiện trình duyệt để khám phá trình duyệt nào đang hiển thị ứng dụng của bạn, rồi chọn kích thước chính xác cho các tính toán. Hoặc bạn có thể dựa vào kích thước cửa sổ kém chính xác hơn.

### Xử lý trình chặn popup trình duyệt

Trong các trình duyệt hiện đại, mỗi lần gọi `Window.open()` đều yêu cầu một sự kiện cử chỉ người dùng riêng biệt vì mục đích bảo mật. Điều này ngăn các trang web spam người dùng với nhiều cửa sổ. Tuy nhiên, điều này gây ra vấn đề cho các ứng dụng đa cửa sổ. Để giải quyết giới hạn này, bạn có thể thiết kế ứng dụng để:

- Không mở quá một cửa sổ mới cùng lúc.
- Tái sử dụng cửa sổ hiện có để hiển thị các trang khác nhau.
- Hướng dẫn người dùng cách cập nhật cài đặt trình duyệt để cho phép nhiều cửa sổ.

Trong ứng dụng demo của chúng tôi, chúng tôi đã chọn phương án thứ ba. Hàm `openWindow()` của chúng tôi chứa đoạn sau:

```js
// …

if (windowRef === null) {
  // If the browser is blocking new windows, close any windows that were
  // able to open and display instructions to help the user fix this problem
  closeAllWindows();
  popoverElem.showPopover();
} else {
  // Store a reference to the window in the windowRefs array
  windowRefs.push(windowRef);
}

// …
```

Nếu trình duyệt chặn một cửa sổ mới, `windowRef` kết quả sẽ là `null`. Trong trường hợp này, chúng ta chạy hàm `closeAllWindows()` để đóng mọi cửa sổ đã mở được trước khi việc chặn bắt đầu, và hiển thị [phần tử popover](/en-US/docs/Web/API/Popover_API) giải thích cách tắt trình chặn popup.

## Trường hợp một cửa sổ trên mỗi màn hình

Nếu bạn muốn mở một cửa sổ trên mỗi màn hình có sẵn với chiều rộng và chiều cao đầy đủ của màn hình, bạn có thể sử dụng mẫu như sau:

```js
// Open a window on each screen of the device
for (const screen of screenDetails.screens) {
  openWindow(
    screen.availLeft,
    screen.availTop,
    screen.availWidth,
    screen.availHeight,
    url,
  );
}
```

## Sự kiện quản lý cửa sổ

Window Management API cung cấp một số sự kiện để phản hồi các thay đổi trong màn hình có sẵn:

- Sự kiện `ScreenDetails` {{domxref("ScreenDetails.screenschange_event", "screenschange")}}
  - : Kích hoạt khi màn hình được kết nối hoặc ngắt kết nối khỏi hệ thống.
- Sự kiện `ScreenDetails` {{domxref("ScreenDetails.currentscreenchange_event", "currentscreenchange")}}
  - : Kích hoạt khi màn hình hiện tại của cửa sổ thay đổi theo một cách nào đó.
- Sự kiện `Screen` {{domxref("Screen.change_event", "change")}}
  - : Kích hoạt trên một màn hình cụ thể khi màn hình đó thay đổi theo một cách nào đó.

Ví dụ, bạn có thể sử dụng sự kiện `screenschange` để phát hiện khi màn hình có sẵn đã thay đổi (có thể khi một màn hình được cắm vào hoặc rút ra), báo cáo thay đổi, đóng tất cả cửa sổ và cập nhật bố cục cửa sổ phù hợp với cấu hình mới:

```js
screenDetails.addEventListener("screenschange", () => {
  // If the new number of screens is different to the old number of screens,
  // report the difference
  if (screenDetails.screens.length !== noOfScreens) {
    console.log(
      `The screen count changed from ${noOfScreens} to ${screenDetails.screens.length}`,
    );
  }

  // If the windows are open, close them and then open them again
  // So that they fit with the new screen configuration
  if (windowRefs.length > 0) {
    closeAllWindows();
    openWindows();
  }
});
```

## Tùy chọn screen của requestFullscreen()

Window Management API thêm tùy chọn `screen` mới vào phương thức {{domxref("Element.requestFullscreen", "requestFullscreen()")}} cho phép bạn chỉ định màn hình nào bạn muốn đặt phần tử vào chế độ toàn màn hình. Ví dụ, nếu bạn muốn đặt nó ở chế độ toàn màn hình trên màn hình chính của hệ điều hành:

```js
try {
  const primaryScreen = (await getScreenDetails()).screens.find(
    (screen) => screen.isPrimary,
  );
  await document.body.requestFullscreen({ screen: primaryScreen });
} catch (err) {
  console.error(err.name, err.message);
}
```
