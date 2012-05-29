module Orcharding
  module RepositoryFactory
    def self.extended(klass)
      def repository
        return @repository if @repository
        Repositories.get_repository self.name.split("::").last.gsub(/\B[A-Z]/, '_\&').downcase
      end

      def repository=(repository)
        @repository = repository
      end
    end
  end
end
