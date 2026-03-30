---
title: Bắt đầu với Vue
slug: Learn_web_development/Core/Frameworks_libraries/Vue_getting_started
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Vue_first_component", "Learn_web_development/Core/Frameworks_libraries")}}

Bây giờ hãy giới thiệu Vue, framework thứ ba trong số các framework của chúng ta. Trong bài viết này, chúng ta sẽ xem xét một chút về nền tảng của Vue, tìm hiểu cách cài đặt và tạo dự án mới, nghiên cứu cấu trúc cấp cao của toàn bộ dự án và một thành phần riêng lẻ, xem cách chạy dự án cục bộ và chuẩn bị để bắt đầu xây dựng ví dụ của chúng ta.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có node + npm được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Thiết lập môi trường phát triển Vue cục bộ, tạo ứng dụng khởi đầu và hiểu những kiến thức cơ bản về cách nó hoạt động.
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Bài hướng dẫn này hướng đến [Vue version 3.4.21](https://github.com/vuejs/core/blob/main/CHANGELOG.md#3421-2024-02-28) sử dụng [`create-vue` 3.10.2](https://github.com/vuejs/create-vue/releases/tag/v3.10.3) (với Node.js version `v20.11.0`) và được sửa đổi lần cuối vào tháng 5 năm 2024.

## Vue rõ ràng hơn

Vue là một JavaScript framework hiện đại cung cấp các tiện ích hữu ích cho việc cải tiến lũy tiến — không giống như nhiều framework khác, bạn có thể sử dụng Vue để nâng cấp HTML hiện có. Điều này cho phép bạn sử dụng Vue như một sự thay thế thả vào cho thư viện như [jQuery](https://jquery.com/).

Ngoài ra, bạn cũng có thể sử dụng Vue để viết toàn bộ các Single Page Applications (SPAs). Điều này cho phép bạn tạo markup được quản lý hoàn toàn bởi Vue, có thể cải thiện trải nghiệm nhà phát triển và hiệu suất khi xử lý các ứng dụng phức tạp. Nó cũng cho phép bạn tận dụng các thư viện để định tuyến phía client và quản lý trạng thái khi bạn cần. Ngoài ra, Vue có cách tiếp cận "trung gian" đối với công cụ như định tuyến phía client và quản lý trạng thái. Trong khi nhóm cốt lõi Vue duy trì các thư viện được đề xuất cho các chức năng này, chúng không được đóng gói trực tiếp vào Vue. Điều này cho phép bạn chọn một thư viện định tuyến/quản lý trạng thái khác nếu chúng phù hợp hơn với ứng dụng của bạn.

Ngoài việc cho phép bạn tích hợp Vue dần dần vào các ứng dụng của mình, Vue cũng cung cấp cách tiếp cận lũy tiến để viết markup. Giống như hầu hết các framework, Vue cho phép bạn tạo các khối markup có thể tái sử dụng thông qua các thành phần. Hầu hết thời gian, các thành phần Vue được viết bằng cú pháp mẫu HTML đặc biệt. Khi bạn cần kiểm soát nhiều hơn những gì cú pháp HTML cho phép, bạn có thể viết JSX hoặc các hàm JavaScript thuần túy để định nghĩa các thành phần của mình.

Khi bạn làm việc qua bài hướng dẫn này, bạn có thể muốn giữ [hướng dẫn Vue](https://vuejs.org/guide/introduction.html) và [tài liệu API](https://vuejs.org/api/) mở trong các tab khác, để bạn có thể tham khảo chúng nếu bạn muốn biết thêm thông tin về bất kỳ chủ đề con nào.

## Cài đặt

Để sử dụng Vue trong một trang web hiện có, bạn có thể thêm một trong các phần tử [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script) sau vào một trang. Điều này cho phép bạn bắt đầu sử dụng Vue trên các trang web hiện có, đó là lý do tại sao Vue tự hào là một framework lũy tiến. Đây là một lựa chọn tuyệt vời khi chuyển đổi một dự án hiện có sử dụng thư viện như jQuery sang Vue. Với phương pháp này, bạn có thể sử dụng nhiều tính năng cốt lõi của Vue, chẳng hạn như các thuộc tính, thành phần tùy chỉnh và quản lý dữ liệu.

- Script phát triển (chưa được tối ưu hóa, nhưng bao gồm các cảnh báo console rất hữu ích cho quá trình phát triển.)

  ```html
  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  ```

- Script sản xuất (Phiên bản tối ưu hóa, cảnh báo console tối thiểu. Khuyến nghị bạn chỉ định số phiên bản khi đưa Vue vào trang web của mình để bất kỳ bản cập nhật framework nào không phá vỡ trang web trực tiếp của bạn mà bạn không biết.)

  ```html
  <script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>
  ```

Tuy nhiên, cách tiếp cận này có một số hạn chế. Để xây dựng các ứng dụng phức tạp hơn, bạn sẽ muốn sử dụng [gói npm Vue](https://www.npmjs.com/package/vue). Điều này sẽ cho phép bạn sử dụng các tính năng nâng cao của Vue và sử dụng các công cụ như Vite hoặc webpack. Để việc xây dựng ứng dụng với Vue dễ dàng hơn, có một công cụ tạo khung CLI [create-vue](https://github.com/vuejs/create-vue) để đơn giản hóa quá trình phát triển. Để sử dụng `create-vue` bạn sẽ cần:

1. Node.js 20 được cài đặt.
2. [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm/) hoặc [yarn](https://yarnpkg.com/).

> [!NOTE]
> Nếu bạn chưa cài đặt những thứ trên, hãy tìm hiểu [thêm về cách cài đặt npm và Node.js](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line#adding_powerups) tại đây.

Để cài đặt Vue và khởi tạo dự án mới, hãy chạy lệnh sau trong terminal của bạn:

```bash
npm create vue@latest
```

Hoặc nếu bạn thích sử dụng yarn:

```bash
yarn create vue@latest
```

Lệnh này sẽ cung cấp cho bạn danh sách các cấu hình dự án mà bạn có thể sử dụng. Có một vài mặc định, nhưng bạn có thể chọn cài đặt riêng cho dự án của mình. Các tùy chọn này cho phép bạn cấu hình những thứ như TypeScript, linting, vue-router, testing và nhiều hơn nữa.
Chúng ta sẽ xem qua các tùy chọn trong các bước khởi tạo bên dưới.

## Khởi tạo dự án mới

Để khám phá các tính năng khác nhau của Vue, chúng ta sẽ xây dựng một ứng dụng danh sách todo mẫu. Chúng ta sẽ bắt đầu bằng cách sử dụng `create-vue` để xây dựng một khung mới cho ứng dụng của chúng ta.
Trong terminal, `cd` đến nơi bạn muốn tạo ứng dụng mẫu, sau đó chạy `npm create vue@latest` (hoặc `yarn create vue@latest` nếu bạn thích Yarn).

Công cụ tương tác cho phép bạn chọn một số tùy chọn và bạn có thể tiếp tục bằng cách nhấn <kbd>Enter</kbd>.
Đối với dự án này, chúng ta sẽ sử dụng cấu hình sau:

```plain
✔ Project name: … todo-vue
✔ Add TypeScript? … No
✔ Add JSX Support? … No
✔ Add Vue Router for Single Page Application development? … No
✔ Add Pinia for state management? … No
✔ Add Vitest for Unit Testing? … No
✔ Add an End-to-End Testing Solution? › No
✔ Add ESLint for code quality? … Yes
? Add Prettier for code formatting? › Yes
```

Sau khi chọn các tùy chọn này, cấu trúc dự án của bạn hiện được cấu hình và các phụ thuộc được định nghĩa trong file `package.json`.
Các bước tiếp theo là cài đặt các phụ thuộc và khởi động máy chủ, và công cụ tiện lợi in ra các lệnh bạn cần để thực hiện điều này:

```plain
Scaffolding project in /path/to/todo-vue...

Done. Now run:

  cd todo-vue
  npm install
  npm run format
  npm run dev
```

## Cấu trúc dự án

Nếu mọi thứ diễn ra thành công, CLI sẽ tạo ra một loạt file và thư mục cho dự án của bạn. Những cái quan trọng nhất như sau:

- `package.json`: File này chứa danh sách các phụ thuộc cho dự án của bạn, cũng như một số siêu dữ liệu và cấu hình `eslint`.
- `yarn.lock`: Nếu bạn chọn `yarn` làm trình quản lý gói, file này sẽ được tạo với danh sách tất cả các phụ thuộc và phụ thuộc con mà dự án của bạn cần.
- `jsconfig.json`: Đây là file cấu hình cho [Visual Studio Code](https://code.visualstudio.com/docs/languages/jsconfig) và cung cấp ngữ cảnh cho VS Code về cấu trúc dự án của bạn và hỗ trợ tự động hoàn thành.
- `vite.config.js`: Đây là file cấu hình cho máy chủ phát triển [Vite](https://vite.dev/) xây dựng và phục vụ dự án của bạn trên máy cục bộ của bạn.
  Máy chủ Vite theo dõi các file nguồn để tìm thay đổi và có thể hot-reload dự án trong khi bạn thực hiện thay đổi.
- `public`: Thư mục này chứa các nội dung tĩnh được xuất bản trong quá trình build.
  - `favicon.ico`: Đây là favicon cho ứng dụng của bạn. Hiện tại, đó là logo Vue.
- `index.html`: Ứng dụng Vue của bạn được chạy từ trang HTML này.
- `src`: Thư mục này chứa phần cốt lõi của ứng dụng Vue của bạn.
  - `main.js`: đây là điểm vào của ứng dụng. Hiện tại, file này khởi tạo ứng dụng Vue của bạn và chỉ ra phần tử HTML nào trong file `index.html` ứng dụng của bạn nên được gắn vào. File này thường là nơi bạn đăng ký các thành phần toàn cục hoặc các thư viện Vue bổ sung.
  - `App.vue`: đây là thành phần cấp cao nhất trong ứng dụng Vue của bạn. Xem bên dưới để biết thêm giải thích về các thành phần Vue.
  - `components`: thư mục này là nơi bạn giữ các thành phần của mình. Hiện tại, nó chỉ có một thành phần ví dụ.
  - `assets`: thư mục này dành để lưu trữ các nội dung tĩnh như CSS và hình ảnh. Vì các file này nằm trong thư mục nguồn, chúng có thể được xử lý bởi webpack. Điều này có nghĩa là bạn có thể sử dụng các bộ tiền xử lý như [Sass/SCSS](https://sass-lang.com/) hoặc [Stylus](https://stylus-lang.com/).

> [!NOTE]
> Tùy thuộc vào các tùy chọn bạn chọn khi tạo dự án mới, có thể có các thư mục khác hiện diện (ví dụ: nếu bạn chọn một router, bạn cũng sẽ có thư mục `views`).

## Các file .vue (single file components)

Giống như trong nhiều front-end framework, các thành phần là phần trung tâm của việc xây dựng ứng dụng trong Vue. Những thành phần này cho phép bạn chia nhỏ một ứng dụng lớn thành các khối xây dựng riêng biệt có thể được tạo và quản lý riêng, và truyền dữ liệu giữa nhau khi cần. Những khối nhỏ này có thể giúp bạn lý luận và kiểm thử code của mình.

Trong khi một số framework khuyến khích bạn tách code mẫu, logic và tạo kiểu thành các file riêng, Vue có cách tiếp cận ngược lại. Sử dụng [Single File Components (SFC)](https://vuejs.org/guide/scaling-up/sfc.html), Vue cho phép bạn nhóm các mẫu, script tương ứng và CSS lại với nhau trong một file duy nhất kết thúc bằng `.vue`. Các file này được xử lý bởi một công cụ build JS (chẳng hạn như Vite hoặc webpack), có nghĩa là bạn có thể tận dụng công cụ build-time trong dự án của mình. Điều này cho phép bạn sử dụng các công cụ như Babel, TypeScript, SCSS và nhiều hơn nữa để tạo ra các thành phần tinh vi hơn.

Hãy nhìn vào bên trong thư mục `src` trong dự án chúng ta tạo với CLI và kiểm tra file `.vue` đầu tiên của bạn: `App.vue`.

### App.vue

Mở file `App.vue` của bạn — bạn sẽ thấy rằng nó có ba phần: `<template>`, `<script>` và `<style>`, chứa thông tin mẫu, kịch bản và tạo kiểu của thành phần. Tất cả các Single File Component đều chia sẻ cùng cấu trúc cơ bản này.

`<template>` chứa tất cả cấu trúc markup và logic hiển thị của thành phần. Mẫu của bạn có thể chứa bất kỳ HTML hợp lệ nào, cũng như một số cú pháp Vue-specific mà chúng ta sẽ đề cập sau.

> [!NOTE]
> Bằng cách đặt thuộc tính `lang` trên thẻ `<template>`, bạn có thể sử dụng cú pháp mẫu Pug thay vì HTML chuẩn — `<template lang="pug">`. Chúng ta sẽ giữ nguyên HTML chuẩn trong suốt bài hướng dẫn này, nhưng đáng biết rằng điều này là có thể.

`<script>` chứa tất cả logic không hiển thị của thành phần. Quan trọng nhất, thẻ `<script>` của bạn là nơi bạn đăng ký cục bộ các thành phần, định nghĩa đầu vào của thành phần (props), xử lý trạng thái cục bộ, định nghĩa các phương thức và nhiều hơn nữa. Bước build của bạn sẽ xử lý đối tượng này và chuyển đổi nó (với mẫu của bạn) thành một thành phần Vue với hàm `render()`.

Trong trường hợp `App.vue`, hai thành phần `TheWelcome` và `HelloWorld` được đăng ký thông qua các import. Khi bạn đăng ký một thành phần theo cách này, bạn đang đăng ký nó cục bộ. Các thành phần được đăng ký cục bộ chỉ có thể được sử dụng bên trong các thành phần đăng ký chúng, vì vậy bạn cần import và đăng ký chúng trong mỗi file thành phần sử dụng chúng. Điều này hữu ích cho {{Glossary("Tree shaking")}} (không tải code không dùng) và tách gói (chỉ tải code khi cần) vì không phải mọi trang trong ứng dụng của bạn đều cần mọi thành phần.

```vue
<script setup>
import HelloWorld from "./components/HelloWorld.vue";
import TheWelcome from "./components/TheWelcome.vue";
</script>
```

> [!NOTE]
> Nếu bạn muốn sử dụng cú pháp [TypeScript](https://www.typescriptlang.org/), bạn cần đặt thuộc tính `lang` trên thẻ `<script>` để báo hiệu cho trình biên dịch rằng bạn đang sử dụng TypeScript — `<script lang="ts">`.

`<style>` là nơi bạn viết CSS cho thành phần. Nếu bạn thêm thuộc tính `scoped` — `<style scoped>` — Vue sẽ giới hạn phạm vi của các kiểu cho nội dung của SFC của bạn. Điều này hoạt động tương tự như các giải pháp CSS-in-JS, nhưng cho phép bạn chỉ viết CSS thuần túy.

> [!NOTE]
> Nếu bạn chọn một bộ tiền xử lý CSS khi tạo dự án qua CLI, bạn có thể thêm thuộc tính `lang` vào thẻ `<style>` để nội dung có thể được xử lý tại thời điểm build. Ví dụ: `<style lang="scss">` sẽ cho phép bạn sử dụng cú pháp SCSS trong thông tin tạo kiểu của mình.

## Chạy ứng dụng cục bộ

Công cụ `create-vue` đi kèm với Vite như một máy chủ phát triển tích hợp. Điều này cho phép bạn chạy ứng dụng cục bộ để bạn có thể kiểm thử nó dễ dàng mà không cần cấu hình máy chủ từ đầu. CLI thêm các lệnh vào file `package.json` của dự án dưới dạng các npm script để bạn có thể dễ dàng chạy chúng.

Trong terminal của bạn, hãy thử chạy `npm run dev` (hoặc `yarn dev` nếu bạn thích yarn). Terminal của bạn sẽ xuất ra thứ gì đó như sau:

```plain
  VITE v5.0.11  ready in 312 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

Nếu bạn điều hướng đến địa chỉ "localhost" trong một tab trình duyệt mới, bạn sẽ thấy ứng dụng của mình (địa chỉ này phải là `http://localhost:5173/` như đã nêu ở trên, nhưng có thể thay đổi tùy theo cài đặt của bạn). Ngay bây giờ, ứng dụng sẽ chứa thông báo chào mừng, liên kết đến tài liệu Vue, liên kết đến các plugin bạn đã thêm khi khởi tạo ứng dụng với CLI và một số liên kết hữu ích khác đến cộng đồng và hệ sinh thái Vue.

## Thực hiện một vài thay đổi

Hãy thực hiện thay đổi đầu tiên của chúng ta với ứng dụng — chúng ta sẽ xóa logo Vue. Mở file `App.vue` và xóa phần tử [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img) khỏi phần template:

```vue
<img
  alt="Vue logo"
  class="logo"
  src="./assets/logo.svg"
  width="125"
  height="125" />
```

Nếu máy chủ của bạn vẫn đang chạy, bạn sẽ thấy logo bị xóa khỏi trang web được kết xuất gần như ngay lập tức. Hãy cũng xóa thành phần `HelloWorld` khỏi mẫu của chúng ta.

Trước tiên hãy xóa dòng này:

```vue
<HelloWorld msg="You did it!" />
```

Nếu bạn lưu file `App.vue` ngay bây giờ, trình soạn thảo của bạn có thể hiển thị lỗi vì chúng ta đã đăng ký thành phần `HelloWorld` nhưng không sử dụng nó. Chúng ta cũng cần xóa các dòng từ bên trong phần tử `<script>` import và đăng ký thành phần:

Xóa những dòng này ngay bây giờ:

```js
import HelloWorld from "./components/HelloWorld.vue";
```

Nếu bạn xóa mọi thứ bên trong thẻ `<template>`, bạn sẽ thấy lỗi nói rằng `The template requires child element` trong trình soạn thảo của bạn.
Bạn có thể khắc phục điều này bằng cách thêm một số nội dung bên trong thẻ `<template>` và chúng ta có thể bắt đầu với một phần tử `<h1>` mới bên trong một `<div>`.
Vì chúng ta sẽ tạo một ứng dụng danh sách todo bên dưới, hãy đặt tiêu đề của chúng ta thành "To-Do List" như sau:

```vue
<template>
  <div id="app">
    <h1>To-Do List</h1>
  </div>
</template>
```

`App.vue` bây giờ sẽ hiển thị tiêu đề của chúng ta, như bạn mong đợi.

## Tóm tắt

Hãy dừng lại ở đây. Chúng ta đã tìm hiểu về một số ý tưởng đằng sau Vue, tạo ra một số khung để ứng dụng ví dụ của chúng ta tồn tại trong đó, kiểm tra nó và thực hiện một vài thay đổi sơ bộ.

Với phần giới thiệu cơ bản xong xuôi, chúng ta sẽ đi sâu hơn và xây dựng ứng dụng mẫu của chúng ta, một ứng dụng Todo list cơ bản cho phép chúng ta lưu trữ danh sách các mục, đánh dấu khi hoàn thành và lọc danh sách theo tất cả, đã hoàn thành và chưa hoàn thành.

Trong bài viết tiếp theo, chúng ta sẽ xây dựng thành phần tùy chỉnh đầu tiên của mình và xem xét một số khái niệm quan trọng như truyền props vào nó và lưu trạng thái dữ liệu của nó.

{{NextMenu("Learn_web_development/Core/Frameworks_libraries/Vue_first_component", "Learn_web_development/Core/Frameworks_libraries")}}
