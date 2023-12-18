require "net/http"

class PagesController < RageController::API
  def index
    pages = Fiber.await([
                          Fiber.schedule { Net::HTTP.get(URI("https://httpbin.org/json")) },
                          Fiber.schedule { Net::HTTP.get(URI("https://httpbin.org/html")) },
                        ])

    render json: { pages: pages }
  end

  def show
    Rage.logger.debug("Page ID: #{params[:id]}")

    render json: { id: params[:id] }
  end
end