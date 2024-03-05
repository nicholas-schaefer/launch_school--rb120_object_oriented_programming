class MeMyselfAndI
  self

    def self.me
      self
    end

    def myself
      self #
    end
  end

  i = MeMyselfAndI.new
  p i.myself

  =begin
  44
  What does each `self` refer to in the above code snippet?
  =end

  <<~Answer
  1 = MeMyselfAndI
  2 = MeMyselfAndI
  3 = <MeMyselfAndI:0x00007f6cf0ff25a8>
  Answer

