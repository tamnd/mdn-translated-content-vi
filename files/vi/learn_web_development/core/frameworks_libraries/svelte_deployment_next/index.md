---
title: Triển khai và các bước tiếp theo
slug: Learn_web_development/Core/Frameworks_libraries/Svelte_deployment_next
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript", "Learn_web_development/Core/Frameworks_libraries")}}

Trong bài viết trước, chúng ta đã học về hỗ trợ TypeScript của Svelte, và cách sử dụng nó để làm cho ứng dụng của bạn mạnh mẽ hơn. Trong bài viết cuối cùng này, chúng ta sẽ xem cách triển khai ứng dụng và đưa nó lên mạng, và cũng chia sẻ một số tài nguyên mà bạn nên tiếp tục theo dõi để tiếp tục hành trình học Svelte.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, bạn nên quen thuộc với các ngôn ngữ
          <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          và có kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Bạn sẽ cần một terminal với node + npm đã cài đặt để biên dịch và xây dựng ứng dụng của mình.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Học cách chuẩn bị ứng dụng Svelte cho production, và những tài nguyên học tập nào bạn nên ghé thăm tiếp theo.
      </td>
    </tr>
  </tbody>
</table>

## Lập trình cùng chúng tôi

### Git

Clone repo GitHub (nếu bạn chưa làm) với:

```bash
git clone https://github.com/opensas/mdn-svelte-tutorial.git
```

Sau đó để đến trạng thái ứng dụng hiện tại, chạy

```bash
cd mdn-svelte-tutorial/08-next-steps
```

Hoặc tải trực tiếp nội dung thư mục:

```bash
npx degit opensas/mdn-svelte-tutorial/08-next-steps
```

Nhớ chạy `npm install && npm run dev` để khởi động ứng dụng ở chế độ phát triển.

## Biên dịch ứng dụng

Cho đến nay chúng ta đã chạy ứng dụng ở chế độ phát triển với `npm run dev`. Như chúng ta đã thấy trước đó, lệnh này yêu cầu Svelte biên dịch các thành phần và tệp JavaScript thành tệp `public/build/bundle.js` và tất cả các phần CSS của các thành phần vào `public/build/bundle.css`. Nó cũng khởi động một máy chủ phát triển và theo dõi các thay đổi, tái biên dịch ứng dụng và làm mới trang khi có thay đổi xảy ra.

Các tệp `bundle.js` và `bundle.css` được tạo ra của bạn sẽ trông như thế này (kích thước tệp ở bên trái):

```plain
  504 Jul 13 02:43 bundle.css
95981 Jul 13 02:43 bundle.js
```

Để biên dịch ứng dụng cho production, chúng ta phải chạy `npm run build` thay thế. Trong trường hợp này, Svelte sẽ không khởi chạy máy chủ web hoặc tiếp tục theo dõi các thay đổi. Tuy nhiên, nó sẽ thu nhỏ và nén các tệp JavaScript bằng [terser](https://terser.org/).

Vì vậy, sau khi chạy `npm run build`, các tệp `bundle.js` và `bundle.css` được tạo ra sẽ trông như thế này:

```plain
  504 Jul 13 02:43 bundle.css
21782 Jul 13 02:43 bundle.js
```

Hãy thử chạy `npm run build` trong thư mục gốc của ứng dụng ngay bây giờ. Bạn có thể nhận được cảnh báo, nhưng bạn có thể bỏ qua điều này cho bây giờ.

Toàn bộ ứng dụng của chúng ta chỉ là 21 KB — 8,3 KB khi được gzip. Không có runtime hoặc dependencies bổ sung để tải xuống, phân tích, thực thi, và giữ chạy trong bộ nhớ. Svelte đã phân tích các thành phần của chúng ta và biên dịch code thành JavaScript thuần túy.

## Nhìn sau quá trình biên dịch Svelte

Theo mặc định, khi bạn tạo một ứng dụng mới với `npx degit sveltejs/template my-svelte-project`, Svelte sẽ sử dụng [rollup](https://rollupjs.org/) làm module bundler.

> [!NOTE]
> Ngoài ra còn có một template chính thức để sử dụng [webpack](https://webpack.js.org/) và cũng có nhiều [plugin do cộng đồng duy trì](https://github.com/sveltejs/integrations#bundler-plugins) cho các bundler khác.

Trong tệp `package.json` bạn có thể thấy rằng các script `build` và `dev` chỉ đơn giản là gọi rollup:

```json
{
  "scripts": {
    "build": "rollup -c",
    "dev": "rollup -c -w",
    "start": "sirv public"
  }
}
```

Trong script `dev` chúng ta đang truyền đối số `-w`, yêu cầu rollup theo dõi tệp và tái xây dựng khi có thay đổi.

Nếu chúng ta xem tệp `rollup.config.js`, chúng ta có thể thấy rằng trình biên dịch Svelte chỉ là một rollup plugin:

```js
import svelte from "rollup-plugin-svelte";
// …
import { terser } from "rollup-plugin-terser";

const production = !process.env.ROLLUP_WATCH;

export default {
  input: "src/main.js",
  output: {
    sourcemap: true,
    format: "iife",
    name: "app",
    file: "public/build/bundle.js",
  },
  plugins: [
    svelte({
      // enable run-time checks when not in production
      dev: !production,
      // we'll extract any component CSS out into
      // a separate file - better for performance
      css(css) {
        css.write("public/build/bundle.css");
      },
    }),
    // More plugins…
  ],
  // …
};
```

Ở phần sau của cùng tệp, bạn cũng sẽ thấy cách rollup thu nhỏ các script trong chế độ production và khởi chạy máy chủ cục bộ ở chế độ phát triển:

```js
export default {
  // …
  plugins: [
    // …
    // In dev mode, call `npm run start` once
    // the bundle has been generated
    !production && serve(),

    // Watch the `public` directory and refresh the
    // browser on changes when not in production
    !production && livereload("public"),

    // If we're building for production (npm run build
    // instead of npm run dev), minify
    production && terser(),
  ],
  // …
};
```

Có [nhiều plugin cho rollup](https://github.com/rollup/awesome) cho phép bạn tùy chỉnh hành vi của nó. Một plugin đặc biệt hữu ích cũng được nhóm Svelte duy trì là [svelte-preprocess](https://github.com/sveltejs/svelte-preprocess), tiền xử lý nhiều ngôn ngữ khác nhau trong các tệp Svelte như PostCSS, SCSS, Less, CoffeeScript, SASS, và TypeScript.

## Triển khai ứng dụng Svelte

Từ góc độ của máy chủ web, một ứng dụng Svelte không gì khác hơn là một tập hợp các tệp HTML, CSS, và JavaScript. Tất cả những gì bạn cần là một máy chủ web có khả năng phục vụ các tệp tĩnh, có nghĩa là bạn có rất nhiều lựa chọn. Hãy xem một vài ví dụ.

> [!NOTE]
> Phần sau có thể được áp dụng cho bất kỳ trang web tĩnh phía client nào yêu cầu bước build, không chỉ ứng dụng Svelte.

### Triển khai với Vercel

Một trong những cách dễ nhất để triển khai ứng dụng Svelte là sử dụng [Vercel](https://vercel.com/home). Vercel là một nền tảng cloud được thiết kế đặc biệt cho các trang tĩnh, có hỗ trợ sẵn cho hầu hết các công cụ front-end phổ biến, Svelte là một trong số đó.

Để triển khai ứng dụng, hãy làm theo các bước sau.

1. [Đăng ký tài khoản Vercel](https://vercel.com/signup).
2. Điều hướng đến thư mục gốc của ứng dụng và chạy `npx vercel`; lần đầu tiên bạn làm điều này, bạn sẽ được nhắc nhập địa chỉ email, và làm theo các bước trong email được gửi đến địa chỉ đó, vì lý do bảo mật.
3. Chạy `npx vercel` một lần nữa, và bạn sẽ được nhắc trả lời một vài câu hỏi, như thế này:

   ```bash
   npx vercel
   ```

   ```plain
   Vercel CLI 19.1.2
   ? Set up and deploy "./mdn-svelte-tutorial"? [Y/n] y
   ? Which scope do you want to deploy to? opensas
   ? Link to existing project? [y/N] n
   ? What's your project's name? mdn-svelte-tutorial
   ? In which directory is your code located? ./
   Auto-detected Project Settings (Svelte):
   - Build Command: `npm run build` or `rollup -c`
   - Output Directory: public
   - Development Command: sirv public --single --dev --port $PORT
   ? Want to override the settings? [y/N] n
      Linked to opensas/mdn-svelte-tutorial (created .vercel)
      Inspect: https://vercel.com/opensas/mdn-svelte-tutorial/[...] [1s]
   ✅  Production: https://mdn-svelte-tutorial.vercel.app [copied to clipboard] [19s]
      Deployed to production. Run `vercel --prod` to overwrite later (https://vercel.link/2F).
      To change the domain or build command, go to https://zeit.co/opensas/mdn-svelte-tutorial/settings
   ```

4. Chấp nhận tất cả các mặc định, và bạn sẽ ổn.
5. Sau khi hoàn thành triển khai, vào URL "Production" trong trình duyệt, và bạn sẽ thấy ứng dụng được triển khai!

Bạn cũng có thể [import dự án Svelte git](https://vercel.com/import/svelte) vào Vercel từ [GitHub](https://github.com/), [GitLab](https://about.gitlab.com/), hoặc [Bitbucket](https://bitbucket.org/product/).

> [!NOTE]
> Bạn có thể cài đặt Vercel toàn cục với `npm i -g vercel` để bạn không phải sử dụng `npx` để chạy nó.

### Triển khai tự động lên GitLab Pages

Để lưu trữ các tệp tĩnh, có nhiều dịch vụ trực tuyến cho phép bạn tự động triển khai trang web khi bạn push thay đổi vào git repository. Hầu hết chúng liên quan đến việc thiết lập một pipeline triển khai được kích hoạt mỗi khi `git push`, và chịu trách nhiệm xây dựng và triển khai trang web của bạn.

Để minh họa điều này, chúng ta sẽ triển khai ứng dụng todos lên [GitLab Pages](https://docs.gitlab.com/user/project/pages/).

1. Đầu tiên bạn sẽ phải [đăng ký tại GitLab](https://gitlab.com/users/sign_up) và sau đó [tạo một dự án mới](https://gitlab.com/projects/new). Đặt cho dự án mới tên ngắn gọn, dễ nhớ như "mdn-svelte-todo". Bạn sẽ có một URL remote trỏ đến git repository GitLab mới của bạn, như `git@gitlab.com:[your-user]/[your-project].git`.
2. Trước khi bạn bắt đầu tải nội dung lên git repository, thực hành tốt là thêm tệp `.gitignore` để yêu cầu git loại trừ các tệp nhất định khỏi kiểm soát nguồn. Trong trường hợp của chúng ta, chúng ta sẽ yêu cầu git loại trừ các tệp trong thư mục `node_modules` bằng cách tạo tệp `.gitignore` trong thư mục gốc của dự án cục bộ, với nội dung sau:

   ```bash
   node_modules/
   ```

3. Bây giờ hãy quay lại GitLab. Sau khi tạo repo mới, GitLab sẽ chào bạn với thông báo giải thích các tùy chọn khác nhau để tải lên các tệp hiện có. Làm theo các bước được liệt kê dưới tiêu đề _Push an existing folder_:

   ```bash
   cd your_root_directory # Go into your project's root directory
   git init
   git remote add origin https://gitlab.com/[your-user]/mdn-svelte-todo.git
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   ```

   > [!NOTE]
   > Bạn có thể sử dụng [giao thức `git`](https://git-scm.com/book/en/v2/Git-on-the-Server-The-Protocols#_the_git_protocol) thay vì `https`, nhanh hơn và giúp bạn không phải nhập username và password mỗi lần truy cập origin repo. Để sử dụng nó, bạn sẽ phải [tạo cặp khóa SSH](https://docs.gitlab.com/user/ssh/#generate-an-ssh-key-pair). URL origin của bạn sẽ như thế này: `git@gitlab.com:[your-user]/mdn-svelte-todo.git`.

Với những hướng dẫn này, chúng ta khởi tạo git repository cục bộ, sau đó đặt remote origin (nơi chúng ta sẽ push code) là repo của chúng ta trên GitLab. Tiếp theo chúng ta commit tất cả tệp vào git repo cục bộ, và sau đó push chúng đến remote origin trên GitLab.

GitLab sử dụng một công cụ tích hợp gọi là GitLab CI/CD để xây dựng trang web của bạn và xuất bản nó lên máy chủ GitLab Pages. Chuỗi script mà GitLab CI/CD chạy để thực hiện nhiệm vụ này được tạo từ tệp có tên `.gitlab-ci.yml`, mà bạn có thể tạo và sửa đổi tùy ý. Một job cụ thể có tên `pages` trong tệp cấu hình sẽ làm cho GitLab biết rằng bạn đang triển khai trang web GitLab Pages.

Hãy thử làm điều này ngay bây giờ.

1. Tạo tệp `.gitlab-ci.yml` bên trong thư mục gốc của dự án và cung cấp cho nó nội dung sau:

   ```yaml
   image: node:latest
   pages:
     stage: deploy
     script:
       - npm install
       - npm run build
     artifacts:
       paths:
         - public
     only:
       - main
   ```

   Ở đây chúng ta đang yêu cầu GitLab sử dụng một image với phiên bản node mới nhất để xây dựng ứng dụng. Tiếp theo chúng ta khai báo job `pages`, để kích hoạt GitLab Pages. Bất cứ khi nào có push vào repo, GitLab sẽ chạy `npm install` và `npm run build` để xây dựng ứng dụng. Chúng ta cũng yêu cầu GitLab triển khai nội dung của thư mục `public`. Ở dòng cuối cùng, chúng ta đang cấu hình GitLab để tái triển khai ứng dụng chỉ khi có push vào nhánh main.

2. Vì ứng dụng của chúng ta sẽ được xuất bản tại một subdirectory (như `https://your-user.gitlab.io/mdn-svelte-todo`), chúng ta sẽ phải làm cho các tham chiếu đến các tệp JavaScript và CSS trong tệp `public/index.html` trở thành tương đối. Để làm điều này, chúng ta chỉ cần xóa các dấu gạch chéo đứng đầu (`/`) khỏi URL `/global.css`, `/build/bundle.css`, và `/build/bundle.js`, như thế này:

   ```html
   <title>Svelte To-Do list</title>

   <link rel="icon" type="image/png" href="favicon.png" />
   <link rel="stylesheet" href="global.css" />
   <link rel="stylesheet" href="build/bundle.css" />

   <script defer src="build/bundle.js"></script>
   ```

   Hãy làm điều này ngay bây giờ.

3. Bây giờ chúng ta chỉ cần commit và push các thay đổi lên GitLab. Làm điều này bằng cách chạy các lệnh sau:

   ```bash
   git add public/index.html
   git add .gitlab-ci.yml
   git commit -m "Added .gitlab-ci.yml file and fixed index.html absolute paths"
   git push
   ```

Bất cứ khi nào có job đang chạy, GitLab sẽ hiển thị một biểu tượng cho thấy tiến trình của job. Nhấp vào nó sẽ cho phép bạn kiểm tra output của job.

![gitlab screenshot showing a deployed commit, which add a gitlab ci file, and changes bundle paths to relative](01-gitlab-pages-deploy.png)

Bạn cũng có thể kiểm tra tiến trình của các job hiện tại và trước đó từ tùy chọn menu _CI / CD_ > _Jobs_ của dự án GitLab.

![a gitlab ci job shown in the gitlab ui, running a lot of commands](02-gitlab-pages-job.png)

Sau khi GitLab hoàn thành xây dựng và xuất bản ứng dụng, nó sẽ có thể truy cập tại `https://your-user.gitlab.io/mdn-svelte-todo/`; trong trường hợp của tôi là `https://opensas.gitlab.io/mdn-svelte-todo/`. Bạn có thể kiểm tra URL trang của bạn trong giao diện người dùng GitLab — xem tùy chọn menu _Settings_ > _Pages_.

Với cấu hình này, bất cứ khi nào bạn push thay đổi vào repo GitLab, ứng dụng sẽ được tự động tái xây dựng và triển khai lên GitLab Pages.

## Tìm hiểu thêm về Svelte

Trong phần này chúng ta sẽ cung cấp cho bạn một số tài nguyên và dự án để kiểm tra, để nâng cao việc học Svelte của bạn.

### Tài liệu Svelte

Để tiếp tục và tìm hiểu thêm về Svelte, bạn chắc chắn nên truy cập [trang chủ Svelte](https://svelte.dev/). Ở đó bạn sẽ tìm thấy [nhiều bài viết](https://svelte.dev/blog) giải thích triết học của Svelte. Nếu bạn chưa làm, hãy đảm bảo bạn xem qua [hướng dẫn tương tác Svelte](https://learn.svelte.dev/tutorial/welcome-to-svelte). Chúng ta đã đề cập hầu hết nội dung của nó, vì vậy sẽ không mất nhiều thời gian để hoàn thành — bạn nên coi đó là thực hành!

Bạn cũng có thể tham khảo [tài liệu Svelte API](https://svelte.dev/docs) và [các ví dụ](https://svelte.dev/examples/hello-world) có sẵn.

Để hiểu động lực đằng sau Svelte, bạn nên đọc bài thuyết trình [Rethinking reactivity](https://www.youtube.com/watch?v=AdNJ3fydeao&t=47s) trên YouTube của [Rich Harris](https://x.com/Rich_Harris). Ông là người tạo ra Svelte, vì vậy ông có một vài điều để nói về nó. Bạn cũng có các slide tương tác ở đây mà, không ngạc nhiên, được xây dựng bằng Svelte. Nếu bạn thích nó, bạn cũng sẽ thích bài thuyết trình [The Return of 'Write Less, Do More'](https://www.youtube.com/watch?v=BzX4aTRPzno), mà Rich Harris đã trình bày tại [JSCAMP 2019](https://jscamp.tech/2019/).

### Các dự án liên quan

Có các dự án khác liên quan đến Svelte đáng kiểm tra:

- [Sapper](https://sapper.svelte.dev/): Một framework ứng dụng được hỗ trợ bởi Svelte cung cấp server-side rendering (SSR), code splitting, định tuyến dựa trên tệp và hỗ trợ offline, và nhiều hơn nữa. Hãy nghĩ về nó như [Next.js](https://nextjs.org/) cho Svelte. Nếu bạn đang lên kế hoạch phát triển một ứng dụng web khá phức tạp, bạn chắc chắn nên xem xét dự án này.
- [Svelte Native](https://svelte.nativescript.org/): Một framework ứng dụng di động được hỗ trợ bởi Svelte. Hãy nghĩ về nó như [React Native](https://reactnative.dev/) cho Svelte.
- [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode): Plugin VS Code được hỗ trợ chính thức để làm việc với các tệp `.svelte`, mà chúng ta đã xem trong [bài viết TypeScript](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript).

### Các tài nguyên học tập khác

- Có một [khóa học đầy đủ về Svelte và Sapper](https://frontendmasters.com/courses/svelte/) của Rich Harris, có sẵn tại Frontend Masters.
- Mặc dù Svelte là một dự án tương đối mới, nhưng có nhiều hướng dẫn và [khóa học](https://www.udemy.com/topic/svelte-framework/?sort=popularity) có sẵn trên web, vì vậy khó để đưa ra khuyến nghị cụ thể.
- Tuy nhiên, [Svelte.js — The Complete Guide](https://www.udemy.com/course/sveltejs-the-complete-guide/) của [Academind](https://academind.com/) là một lựa chọn rất phổ biến với xếp hạng tốt.
- [The Svelte Handbook](https://www.freecodecamp.org/news/the-svelte-handbook/), của [Flavio Copes](https://flaviocopes.com/), cũng là một tài liệu tham khảo hữu ích để học các khái niệm Svelte chính.
- Nếu bạn thích đọc sách, có [Svelte and Sapper in Action](https://www.manning.com/books/svelte-and-sapper-in-action) của [Mark Volkman](https://x.com/mark_volkmann), được xuất bản vào tháng 10 năm 2020, mà [bạn có thể xem trước trực tuyến](https://livebook.manning.com/book/svelte-and-sapper-in-action/welcome) miễn phí.
- Nếu bạn muốn đi sâu hơn và hiểu cơ chế bên trong của trình biên dịch Svelte, bạn nên xem các bài viết blog [_Compile Svelte in your head_](https://lihautan.com/compile-svelte-in-your-head) của [Tan Li Hau](https://x.com/lihautan).

### Tương tác với cộng đồng

Có một số cách khác nhau để nhận hỗ trợ và tương tác với cộng đồng Svelte:

- [svelte.dev/chat](https://discord.com/invite/yy75DKs): Máy chủ Discord của Svelte.
- [@sveltejs](https://x.com/sveltejs): Tài khoản Twitter chính thức.
- [@sveltesociety](https://x.com/sveltesociety): Tài khoản Twitter cộng đồng Svelte.
- [Svelte Recipes](https://github.com/svelte-society/recipes-mvp#recipes-mvp): Kho lưu trữ công thức, mẹo và thực hành tốt nhất do cộng đồng xây dựng để giải quyết các vấn đề phổ biến.
- [Câu hỏi Svelte trên Stack Overflow](https://stackoverflow.com/questions/tagged/svelte): Câu hỏi với tag `svelte` trên SO.
- [Cộng đồng Svelte reddit](https://www.reddit.com/r/sveltejs/): Trang thảo luận và đánh giá nội dung cộng đồng Svelte trên reddit.
- [Cộng đồng Svelte DEV](https://dev.to/t/svelte): Bộ sưu tập các bài viết kỹ thuật và hướng dẫn liên quan đến Svelte từ cộng đồng DEV.to.

## Kết thúc

Xin chúc mừng! Bạn đã hoàn thành hướng dẫn Svelte. Trong các bài viết trước, chúng ta đã đi từ không biết gì về Svelte đến xây dựng và triển khai một ứng dụng hoàn chỉnh.

- Chúng ta đã học về triết học Svelte và điều gì khiến nó khác với các framework front-end khác.
- Chúng ta đã thấy cách thêm hành vi động vào trang web, cách tổ chức ứng dụng trong các thành phần và các cách khác nhau để chia sẻ thông tin giữa chúng.
- Chúng ta đã tận dụng hệ thống khả năng phản ứng của Svelte và học cách tránh các cạm bẫy phổ biến.
- Chúng ta cũng đã thấy một số khái niệm và kỹ thuật nâng cao để tương tác với các phần tử DOM và để mở rộng khả năng phần tử HTML theo cách lập trình bằng cách sử dụng chỉ thị `use`.
- Sau đó chúng ta đã thấy cách sử dụng stores để làm việc với kho lưu trữ dữ liệu trung tâm, và chúng ta đã tạo store tùy chỉnh của riêng mình để lưu trữ dữ liệu của ứng dụng vào Web Storage.
- Chúng ta cũng đã xem xét hỗ trợ TypeScript của Svelte.

Trong bài viết này, chúng ta đã học về một vài tùy chọn không phức tạp để triển khai ứng dụng trong production và đã thấy cách thiết lập một pipeline cơ bản để triển khai ứng dụng lên GitLab trên mỗi commit. Sau đó chúng ta đã cung cấp cho bạn danh sách các tài nguyên Svelte để tìm hiểu sâu hơn.

Xin chúc mừng! Sau khi hoàn thành loạt hướng dẫn này, bạn nên có một nền tảng vững chắc để bắt đầu phát triển các ứng dụng web chuyên nghiệp với Svelte.

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Svelte_TypeScript", "Learn_web_development/Core/Frameworks_libraries")}}
