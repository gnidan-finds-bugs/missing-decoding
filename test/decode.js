const Decoder = require("@truffle/decoder");

const Primary = artifacts.require("Primary");
const Proposal = artifacts.require("Proposal");

contract("Proposal", function() {
  it("decodes event", async function() {
    const primary = await Primary.new();
    const proposal = await Proposal.new();
    const { receipt } = await primary.execute(proposal.address);

    const decoder = await Decoder.forProject([Primary, Proposal]);

    const decodings = await decoder.decodeLog(receipt.rawLogs[0]);

    assert.lengthOf(decodings, 1);
  });
});
