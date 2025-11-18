# 使用官方的 Node.js 作为基础镜像
FROM node:20

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY package*.json ./

# 安装依赖
RUN npm install

# 将整个项目复制到容器中
COPY . .

# 编译 Vue 项目
RUN npm run build

# 安装一个轻量的 HTTP 服务器（例如 serve）来提供构建后的文件
RUN npm install -g serve

# 暴露应用端口
EXPOSE 5000

# 启动 serve 服务
CMD ["serve", "-s", "dist", "-l", "5000"]
